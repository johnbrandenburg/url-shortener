import mongoose, {Schema, Document} from 'mongoose';

export interface IUrl extends Document {
    shortUrl: number;
    longUrl: string;
}

const UrlSchema: Schema = new Schema({
    shortUrl: Number,
    longUrl: String
});


export default mongoose.model<IUrl>('Url', UrlSchema);