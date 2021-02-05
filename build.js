const fs = require('fs');
const childProcess = require('child_process')
const exec = childProcess.exec

args = process.argv

files = fs.readdirSync(args[0])

dockerfiles = []

builtImages = 0

for (const i in files; i.endsWith('.dockerfile')) {
    dockerfiles.push(args[0] + i)
}

for (const dockerfile in dockerfiles) {
    let content = fs.readfileSync(dockerfile)
    let firstlines = content.split('\n', 2)
    let imageName = firstlines.replace("# name: ", "")
    let tag = firstline.replace("# tag: ", "")
    exec(`docker build -t ${dockerfile} -t ${imageName}:${tag}`)
    exec(`docker push ${imageName}:${tag}`)
    builtImages++
}

console.log(`Successfully built and pushed ${builtImages} images!`) 
