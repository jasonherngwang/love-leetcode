import express, { Request, Response } from 'express';
import problemService from '../services/problemService';

const problemRouter = express.Router();

problemRouter.get('/', async (_req: Request, res: Response) => {
  const allProblems = await problemService.getProblems();
  res.json(allProblems);
});

problemRouter.post('/', async (req: Request, res: Response) => {
  const newProblem = req.body;
  const addedProblem = await problemService.addProblem(newProblem);
  return res.status(201).json(addedProblem);
});

problemRouter.put('/:id', async (req: Request, res: Response) => {
  const { id } = req.params;
  const updatedData = req.body;
  const updatedProblem = await problemService.updateProblem(id, updatedData);
  return res.status(201).json(updatedProblem);
});

problemRouter.delete('/:id', async (req: Request, res: Response) => {
  const { id } = req.params;
  await problemService.deleteProblem(id);
  return res.status(204).end();
});

export default problemRouter;
