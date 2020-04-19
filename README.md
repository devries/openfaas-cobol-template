# COBOL template

This is a COBOL template for OpenFaaS.

# Instructions

Get the template by running the command:
```
faas-cli template pull https://github.com/devries/openfaas-cobol-template
```

Create a new COBOL project using the command:
```
faas-cli new --lang cobol coboltest --prefix="<your-docker-username-here>"
```

The `coboltest` directory will contain a handler program which reads 25
characters from Standard Input and writes "HELLO " followed by the input. If
the input is empty or all spaces, the program writes "HELLO WORLD".

Build the function:
```
faas-cli build -f coboltest.yml
```

Push the function to docker hub:
```
faas-cli push -f coboltest.yml
```

And deploy the function:
```
faas-cli deploy -f coboltest.yml```
```

Once the function is up and running on your Kubernetes cluster, you can test
it out.

```
$ echo "" | faas-cli invoke coboltest
HELLO WORLD
$ echo "CHRIS" | faas-cli invoke coboltest
HELLO CHRIS
```
