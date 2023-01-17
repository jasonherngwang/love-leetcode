import express, { Request, Response } from 'express';
import problemService from '../services/problemService';
import { Difficulty } from '@prisma/client';

const problemRouter = express.Router();

problemRouter.get('/', async (_req: Request, res: Response) => {
  const allProblems = await problemService.getProblems();

  res.json(allProblems);
});

problemRouter.get('/:problemId', async (req: Request, res: Response) => {
  const { problemId } = req.params;
  const problem = await problemService.getProblem(problemId);
  if (!problem) {
    return res.status(400).json({ error: 'problem does not exist' });
  }

  res.json(problem);
});

problemRouter.post('/', async (req: Request, res: Response) => {
  const newProblem = req.body;
  const addedProblem = await problemService.addProblem(newProblem);
  if (!addedProblem) {
    return res.status(400).json({ error: 'unable to add problem' });
  }

  return res.status(201).json(addedProblem);
});

problemRouter.put('/:problemId', async (req: Request, res: Response) => {
  const { problemId } = req.params;
  const updatedData = req.body;

  if (!Object.values(Difficulty).includes(updatedData.difficulty)) {
    return res
      .status(400)
      .json({ error: 'difficulty must be easy, medium, or hard' });
  }

  const updatedProblem = await problemService.updateProblem(
    problemId,
    updatedData
  );
  if (!updatedProblem) {
    return res.status(400).json({ error: 'unable to update problem' });
  }

  return res.status(201).json(updatedProblem);
});

problemRouter.delete('/:problemId', async (req: Request, res: Response) => {
  const { problemId } = req.params;
  await problemService.deleteProblem(problemId);

  return res.status(204).end();
});

export default problemRouter;
