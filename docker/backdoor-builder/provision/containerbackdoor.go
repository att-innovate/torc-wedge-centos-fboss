package main

import (
	"net/http"
	"encoding/json"
	"os"
	"os/exec"
	"html"
	"strings"
	"flag"
	"fmt"
)

// cmdline argument
var portNumber = flag.Int("port", 8085, "Port number listening on")


type Command struct {
	Cmd string `json:"cmd"`
	Env string `json:"env"`
}

func handler(responseWriter http.ResponseWriter, request *http.Request) {
	defer request.Body.Close()

	cmdIn := &Command{}
	if err := json.NewDecoder(request.Body).Decode(&cmdIn); err != nil {
		writeResponse(responseWriter, http.StatusBadRequest, err.Error())
		return
	}

	cmdElements := strings.Split(cmdIn.Cmd, " ")
	cmd := exec.Command(cmdElements[0], cmdElements[1:]...)

	if len(cmdIn.Env) > 0 {
		env := os.Environ()
		env = append(env, cmdIn.Env)
		cmd.Env = env
	}

	path := html.EscapeString(request.URL.Path)
	if strings.HasSuffix(path, "/sync") {
		output, error := cmd.CombinedOutput()

		if error != nil {
			writeResponse(responseWriter, http.StatusBadRequest, error.Error())
			return
		}

		responseWriter.Header().Set("Content-Type", "application/json")
		writeResponse(responseWriter, http.StatusAccepted, string(output[:]))

	} else if strings.HasSuffix(path, "/async") {
		error := cmd.Start()

		if error != nil {
			writeResponse(responseWriter, http.StatusBadRequest, error.Error())
			return
		}

		writeResponse(responseWriter, http.StatusAccepted, "started")

	} else {
		writeResponse(responseWriter, http.StatusBadRequest, "use /sync or /async")

	}
}

func writeResponse(responseWriter http.ResponseWriter, code int, message string) {
	responseWriter.WriteHeader(code)
	data := struct {
			Code    int    `json:"code"`
			Message string `json:"message"`
    }{
		code,
		message,
	}
	responseWriter.Header().Set("Content-Type", "application/json")
	json.NewEncoder(responseWriter).Encode(&data)
}

func main() {
	flag.Parse()
	listenOn := fmt.Sprintf(":%v", *portNumber)

    http.HandleFunc("/", handler)
    http.ListenAndServe(listenOn, nil)
}