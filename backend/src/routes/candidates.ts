import express, { Request, Response } from 'express';
import candidateService from '../services/candidateService';

const candidateRouter = express.Router();

candidateRouter.get('/', async (_req: Request, res: Response) => {
  const allCandidates = await candidateService.getCandidates();
  res.json(allCandidates);
});

candidateRouter.put('/:candidateId', async (req: Request, res: Response) => {
  const { candidateId } = req.params;
  const updatedCandidate = await candidateService.addVote(candidateId);
  return res.status(201).json(updatedCandidate);
});

export default candidateRouter;
