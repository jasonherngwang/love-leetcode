import { VOTES_URL } from '@/constants';

async function getVotes() {
  const res = await fetch(VOTES_URL);
  const votes = await res.json();
  return votes;
}

async function addVote(score: string) {
  console.log(score);
  const res = await fetch(`${VOTES_URL}/${score}`, { method: 'PUT' });
  const updatedVotes = await res.json();
  return updatedVotes;
}

export { getVotes, addVote };
