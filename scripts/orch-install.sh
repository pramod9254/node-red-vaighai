echo 'Starting node-red npm install..'
npm install -g --unsafe-perm node-red
npm install

if [ $? -eq 0 ]; then

    echo 'Starting nodes npm install..'

    cd ./nodes
    npm install

    if [ $? -eq 0 ]; then
        echo 'Linking nodes with node-red..'
        npm link
        cd ../.node-red
        npm install
        npm link nodes
        echo 'FINISHED'
    else
        echo 'nodes npm install failed.'
    fi

else
    echo 'Orchestrator npm install failed'
fi