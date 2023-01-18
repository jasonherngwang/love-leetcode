import { IVote, VoteModel } from '../../models/vote';

async function getVotes() {
  const votes = await VoteModel.findOne();
  return votes;
}

async function addVote(score: string) {
  const votes: any = await VoteModel.findOne();
  votes[score] += 1;
  votes.save();
  return votes;
}

export default { getVotes, addVote };
