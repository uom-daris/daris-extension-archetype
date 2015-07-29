#!/bin/bash

echo -n "Enter your organization's short name(acronym)[e.g. nig]:"
read ORG_NAME_SHORT
if [[ -z ${ORG_NAME_SHORT} ]]; then
    echo "You must supply the short name of your organization." 2>&1 
    exit 1
fi
ORG_NAME_SHORT=$(echo ${ORG_NAME_SHORT} | tr '[:upper:]' '[:lower:]')


echo -n "Enter your organization's full name[e.g. 'Neuroimaging Group']:"
read ORG_NAME_FULL
if [[ -z ${ORG_NAME_FULL} ]]; then
    echo "You must supply the short name of your organization." 2>&1 
    exit 2
fi

echo -n "Enter the Maven project's groupId[Defaults to ${ORG_NAME_SHORT}]:"
read GROUP_ID
if [[ -z ${GROUP_ID} ]]; then
    GROUP_ID=${ORG_NAME_SHORT}
fi

echo -n "Enter the Maven project's artifactId[Defaults to daris-${ORG_NAME_SHORT}]:"
read ARTIFACT_ID
if [[ -z ${ARTIFACT_ID} ]]; then
    ARTIFACT_ID="daris-${ORG_NAME_SHORT}"
fi

echo -n "Enter the Maven project's version[Defaults to 0.0.1-SNAPSHOT]:"
read VERSION
if [[ -z ${VERSION} ]]; then
    VERSION=0.0.1-SNAPSHOT
fi

echo -n "Enter the Java package[Defaults to ${ORG_NAME_SHORT}.daris.plugin]:"
read PACKAGE
if [[ -z ${PACKAGE} ]]; then
    PACKAGE=${ORG_NAME_SHORT}.daris.plugin
fi

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
