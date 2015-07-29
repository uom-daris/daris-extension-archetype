#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Error: invalid arguments." 2>&1
    echo ""
    echo "Usage: $(basename $0) <org-name-short> <org-name-full>"
    exit 1
fi

ORG_NAME_SHORT=$(echo $1 | tr '[:upper:]' '[:lower:]')
ORG_NAME_FULL=$2
GROUP_ID=${ORG_NAME_SHORT}
ARTIFACT_ID="daris-${ORG_NAME_SHORT}"
VERSION=0.0.1-SNAPSHOT
PACKAGE=${ORG_NAME_SHORT}.daris.plugin

echo "org_name_short=${ORG_NAME_SHORT}"
echo "org_name_full=\"${ORG_NAME_FULL}\""
echo "groupId=${GROUP_ID}"
echo "artifactId=${ARTIFACT_ID}"
echo "version=${VERSION}"
echo "package=${PACKAGE}"

echo ""
DIR=$(basename $(pwd))
if [[ $DIR == "daris-extension-archetype" ]]; then
    # do not generate the project in daris-extension-archetype project directory.
    cd ..
    DIR=$(pwd)
fi
mvn archetype:generate -B -DarchetypeGroupId=au.edu.unimelb.daris -DarchetypeArtifactId=daris-extension-archetype -DarchetypeVersion=0.0.1 -DgroupId=${GROUP_ID} -DartifactId=${ARTIFACT_ID} -Dversion=${VERSION} -Dpackage=${PACKAGE} -Dorg_name_short=${ORG_NAME_SHORT} -Dorg_name_full="${ORG_NAME_FULL}"
