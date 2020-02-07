import mongoose from 'mongoose';

const initDB = async () => {
    try {
        const client = await mongoose.connect(`${process.env.MONGO_URL}`, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        return client;
    } catch (err) {
        // tslint:disable-next-line
        console.error(`Error initializing database: ${err}`);
        process.exit(1);
    }
}

export default initDB;