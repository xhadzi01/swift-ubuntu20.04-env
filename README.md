
## initialize a new empty directory

docker run -v "C:\projectbins\swift-ubuntu20.04-env\code:/code" swift:5.9.2 bash -c "cd ./code && swift package init --type executable"

## build

docker run -v "C:\projectbins\swift-ubuntu20.04-env\code:/code" swift:5.9.2 swift build -v --package-path /code

## run code

docker run -v "C:\projectbins\swift-ubuntu20.04-env\code:/code" swift:5.9.2 ./code/.build/debug/code

## show generated files

docker run -v "C:\projectbins\swift-ubuntu20.04-env\code:/code" swift:5.9.2 bash -c "ls /code/.build/debug"