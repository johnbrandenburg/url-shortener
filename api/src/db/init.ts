import mongoose from 'mongoose';

const initDB = async () => {
    try {
        const client = await mongoose.connect('mongodb://localhost/my_database', {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
                    // tslint:disable-next-line
console.log(client)
        return client;
    } catch (err) {
        // tslint:disable-next-line
        console.error(`Error initializing database: ${err}`);
        process.exit(1);
    }
}

export default initDB;