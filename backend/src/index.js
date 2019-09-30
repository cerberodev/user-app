const app = require('./app');
const { connect } = require('./database');

async function main(){
    //Database connected
    await connect();
    // Express aplication
    await app.listen(27017)
    console.log('Server on port 4000');
}

main();