import { Schema, model, Types } from 'mongoose';

interface ICandidate {
  _id: Types.ObjectId;
  name: string;
  votes: number;
}

const CandidateSchema = new Schema<ICandidate>({
  name: {
    type: String,
    required: true,
    minLength: 1,
  },
  votes: {
    type: Number,
    required: true,
  },
});

/* eslint-disable no-param-reassign */
CandidateSchema.set('toJSON', {
  transform: (_document, returnedObject) => {
    returnedObject.id = returnedObject._id.toString();
    delete returnedObject._id;
    delete returnedObject.__v;
  },
});
/* eslint-enable no-param-reassign */

const CandidateModel = model('Candidate', CandidateSchema);

export { ICandidate, CandidateModel };
