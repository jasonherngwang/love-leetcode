import { Schema, model, Types } from 'mongoose';

interface IVote {
  _id: Types.ObjectId;
  great: number;
  good: number;
  ok: number;
  bad: number;
  terrible: number;
}

const VoteSchema = new Schema<IVote>({
  great: {
    type: Number,
    required: true,
  },
  good: {
    type: Number,
    required: true,
  },
  ok: {
    type: Number,
    required: true,
  },
  bad: {
    type: Number,
    required: true,
  },
  terrible: {
    type: Number,
    required: true,
  },
});

/* eslint-disable no-param-reassign */
VoteSchema.set('toJSON', {
  transform: (_document, returnedObject) => {
    returnedObject.id = returnedObject._id.toString();
    delete returnedObject._id;
    delete returnedObject.__v;
  },
});
/* eslint-enable no-param-reassign */

const VoteModel = model('Vote', VoteSchema);

export { IVote, VoteModel };
