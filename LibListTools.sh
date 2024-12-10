#!/bin/bash

# Tools to perform actions on list of my embedded C++ libraries

# Author: Martin Eden
# Last mod.: 2024-12-11

LibsList="LibrariesList.txt"

##

GetLibraryName()
{
  local Name=$1
  echo "me_$Name"
}

GetRepositoryName()
{
  local Name=$1
  local LibName=$(GetLibraryName $Name)
  echo "Embedded-$LibName"
}

GetRepositoryUrl()
{
  local Name=$1
  local RepoName=$(GetRepositoryName $Name)
  echo "https://github.com/martin-eden/$RepoName"
}

##

Acli-GetInstallCommand()
{
  local Name=$1
  local RepoUrl=$(GetRepositoryUrl $Name)

  echo "arduino-cli lib install --git-url $RepoUrl"
}

Acli-GetRemoveCommand()
{
  local Name=$1
  local LibName=$(GetLibraryName $Name)

  echo "arduino-cli lib uninstall $LibName"
}

##

Acli-Install()
{
  local Name=$1
  local Cmd=$(Acli-GetInstallCommand $Name)

  echo "Acli-Install ( $Cmd )"

  eval $Cmd
}

Acli-Remove()
{
  local Name=$1
  local Cmd=$(Acli-GetRemoveCommand $Name)

  echo "Acli-Remove ( $Cmd )"

  eval $Cmd
}

##

Git-GetInstallCommand()
{
  local Name=$1
  local RepoUrl=$(GetRepositoryUrl $Line)
  local LibName=$(GetLibraryName $Line)

  echo "git clone $RepoUrl $LibName"
}

Git-GetRemoveCommand()
{
  local Name=$1
  local RepoUrl=$(GetRepositoryUrl $Line)
  local LibName=$(GetLibraryName $Line)

  echo "rm -rf ./$LibName"
}

##

Git-Install()
{
  local Name=$1
  local Cmd=$(Git-GetInstallCommand $Name)

  echo "Git-Install ( $Cmd )"

  eval $Cmd
}

Git-Remove()
{
  local Name=$1
  local Cmd=$(Git-GetRemoveCommand $Name)

  echo "Git-Remove ( $Cmd )"

  eval $Cmd
}

##

Acli-InstallAll()
{
  echo "Acli-InstallAll"
  echo "("

  while read Line; do
    Acli-Install $Line
  done < $LibsList

  echo ")"
}

Acli-RemoveAll()
{
  echo "Acli-RemoveAll"
  echo "("

  while read Line; do
    Acli-Remove $Line
  done < $LibsList

  echo ")"
}

##

Git-InstallAll()
{
  echo "Git-InstallAll"
  echo "("

  while read Line; do
    Git-Install $Line
  done < $LibsList

  echo ")"
}

Git-RemoveAll()
{
  echo "Git-RemoveAll"
  echo "("

  while read Line; do
    Git-Remove $Line
  done < $LibsList

  echo ")"
}

##

# Exports
#
#   Acli-InstallAll
#   Acli-RemoveAll
#   Git-InstallAll
#   Git-RemoveAll

# 2024-12-11
