#!/bin/bash

build=$1
token=$2
project="Discord.Addons.MicrosoftLogging/Discord.Addons.MicrosoftLogging.csproj"
feed="https://www.myget.org/F/discord-net/api/v3/index.json"

build=$(printf %05d $build)
dotnet pack $project -c "Release" -o "../artifacts" /p:BuildNumber="$build" /p:IsTagBuild="$TRAVIS_TAG"
dotnet nuget push ./artifcats/*.nupkg -s $feed -k $token