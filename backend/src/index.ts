import cors from 'cors';
import express, { Application } from 'express';
import problemRouter from './routes/problems';

const app: Application = express();

app.use(cors());
app.use(express.json());

app.use('/api/problems', problemRouter);

app.listen(3001, () => {
  console.log(`Server running at http://localhost:3001`);
});
