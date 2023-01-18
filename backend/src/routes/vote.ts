import express, { Request, Response } from 'express';
import voteService from '../services/voteService';

const voteRouter = express.Router();

voteRouter.get('/', async (_req: Request, res: Response) => {
  const votes = await voteService.getVotes();
  return res.json(votes);
});

voteRouter.put('/:score', async (req: Request, res: Response) => {
  const { score } = req.params;
  const updatedVotes = await voteService.addVote(score);
  return res.status(201).json(updatedVotes);
});

export default voteRouter;
