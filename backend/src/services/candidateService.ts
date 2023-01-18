import { CandidateModel } from '../../models/candidate';

async function getCandidates() {
  const candidates = await CandidateModel.find({});
  return candidates;
}

async function addVote(candidateId: string) {
  const candidate = await CandidateModel.findById(candidateId);
  let updatedCandidate = null;
  if (candidate) {
    updatedCandidate = await CandidateModel.findByIdAndUpdate(
      candidateId,
      {
        votes: candidate.votes + 1,
      },
      { new: true, runValidators: true, context: 'query' }
    );
  }
  return updatedCandidate;
}

export default { getCandidates, addVote };
