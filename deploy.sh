#!/bin/bash

token=$1
project="Discord.Addons.MicrosoftLogging/Discord.Addons.MicrosoftLogging.csproj"
feed="https://www.myget.org/F/discord-net/api/v3/index.json"

build=$(printf %05d $TRAVIS_BULID_NUMBER)
dotnet pack $project -c "Release" -o "../artifacts" /p:BuildNumber="$build" /p:IsTagBuild="$TRAVIS_TAG"
dotnet nuget push -s $feed -k $token