import * as dotenv from 'dotenv';
dotenv.config();

import cors from 'cors';
import express, { Application } from 'express';
import mongoose from 'mongoose';

import problemRouter from './routes/problems';
import candidateRouter from './routes/candidates';

const app: Application = express();

app.use(cors());
app.use(express.json());

console.log('Connecting to', process.env.MONGO_URI);
mongoose.set('strictQuery', false);
mongoose
  .connect(process.env.MONGO_URI ?? '')
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error.message);
  });

app.use('/api/problems', problemRouter);
app.use('/api/candidates', candidateRouter);

app.listen(3001, () => {
  console.log(`Server running at http://localhost:3001`);
});
