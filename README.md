# daris-extension-archetype
The Maven archetype can be used to generate daris domain specific package projects.

### 1. Clone the archetype project:
    git clone https://github.com/uom-daris/daris-extension-archetype.git

### 2. Install the archetype into your local maven repository:
    cd daris-extension-archetype
    mvn clean install

### 3. Generate a project using the archetype(e.g.):
    mvn archetype:generate -B \
        -DarchetypeGroupId=au.edu.unimelb.daris \
        -DarchetypeArtifactId=daris-extension-archetype \
        -DarchetypeVersion=0.0.1 \
        -DgroupId=nig \
        -DartifactId=daris-nig \
        -Dversion=0.0.1-SNAPSHOT \
        -Dpackage=nig.daris.plugin \
        -Dorg_name_short=nig \
        -Dorg_name_full="Neuroimaging Group"

### 4. Import the generated project into eclipse
