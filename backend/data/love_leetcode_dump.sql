--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: Difficulty; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."Difficulty" AS ENUM (
    'easy',
    'medium',
    'hard'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Problem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Problem" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    difficulty public."Difficulty" DEFAULT 'easy'::public."Difficulty" NOT NULL,
    link character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    problem_id text NOT NULL
);


--
-- Name: Problem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Problem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Problem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Problem_id_seq" OWNED BY public."Problem".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- Name: Problem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Problem" ALTER COLUMN id SET DEFAULT nextval('public."Problem_id_seq"'::regclass);


--
-- Data for Name: Problem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Problem" (id, name, category, difficulty, link, source, problem_id) FROM stdin;
213	Contains Duplicate	Arrays	easy	https://leetcode.com/problems/contains-duplicate/	neetcode	dfef163d-c11c-48d4-a365-da28ba0becbe
214	Binary Search	Binary Search	easy	https://leetcode.com/problems/binary-search/	neetcode	52cfcb36-3cac-4c50-a975-5033ecfa324a
215	Valid Perfect Square	Binary Search	easy	https://leetcode.com/problems/valid-perfect-square/	capstone	b6c56f7a-0cd1-47c3-a9e3-f410407322e8
216	Counting Bits	Bit Manipulation	easy	https://leetcode.com/problems/counting-bits/	neetcode	ff3c3acc-c04b-48d9-9a9e-b54da48d2459
217	Missing Number	Bit Manipulation	easy	https://leetcode.com/problems/missing-number/	neetcode	89e94b4e-3acf-4be8-b5e6-80cfc2efac34
218	Number of 1 Bits	Bit Manipulation	easy	https://leetcode.com/problems/number-of-1-bits/	neetcode	65740a19-288f-4127-a173-a055b0438439
219	Reverse Bits	Bit Manipulation	easy	https://leetcode.com/problems/reverse-bits/	neetcode	cd4992e8-357c-451a-bf6a-75f9ec2f8804
220	Single Number	Bit Manipulation	easy	https://leetcode.com/problems/single-number/	neetcode	ab74c09a-5195-47f1-a4ed-7d301d63b63f
221	Climbing Stairs	Dynamic Programming	easy	https://leetcode.com/problems/climbing-stairs/	capstone	1ee60548-d741-4fd7-bea6-e2c14d605324
222	Min Cost Climbing Stairs	Dynamic Programming	easy	https://leetcode.com/problems/min-cost-climbing-stairs/	neetcode	e64d3b10-4843-4560-898d-12e7be6fc7ad
223	Valid Anagram	General	easy	https://leetcode.com/problems/valid-anagram/	capstone	c5b700ca-10b8-4145-b230-ff81f625f0be
224	Roman to Integer	General	easy	https://leetcode.com/problems/roman-to-integer/description/	capstone	a3354304-03f0-4ef9-b303-93eba4cfd014
225	Kth Largest Element in a Stream	Heap / Priority Queue	easy	https://leetcode.com/problems/kth-largest-element-in-a-stream/	neetcode	c7311b26-ac24-4eb6-8bd2-bfa0162dfb19
226	Last Stone Weight	Heap / Priority Queue	easy	https://leetcode.com/problems/last-stone-weight/	neetcode	0630eb44-9f40-41a1-8fe8-a1c6e0e0af50
227	Meeting Rooms	Intervals	easy	https://leetcode.com/problems/meeting-rooms/	neetcode	684049c7-ea9b-4da4-8910-d24feb5590bb
228	Linked List Cycle	Linked List	easy	https://leetcode.com/problems/linked-list-cycle/	capstone	9688a8d4-54a8-497a-8981-1cbdf529bcc0
229	Merge Two Sorted Lists	Linked List	easy	https://leetcode.com/problems/merge-two-sorted-lists/	capstone	956e827d-a1d9-4828-bb24-c047f2339405
230	Reverse Linked List	Linked List	easy	https://leetcode.com/problems/reverse-linked-list/	capstone	ba81fae8-77d8-4c25-a808-8ccaf22b4e54
231	Remove Linked List Elements	Linked List	easy	https://leetcode.com/problems/remove-linked-list-elements/	capstone	0c4e9698-820b-4899-9a72-1db8a5513757
232	Palindrome Linked List	Linked List	easy	https://leetcode.com/problems/palindrome-linked-list/	capstone	f8a9f96f-0199-42b1-a696-95133db1213f
233	Remove Duplicates from Sorted List	Linked List	easy	https://leetcode.com/problems/remove-duplicates-from-sorted-list/	capstone	7eff815f-c8fb-4735-8161-694422bace77
234	Happy Number	Math & Geometry	easy	https://leetcode.com/problems/happy-number/	neetcode	6f19a36a-0c0a-4c00-933b-7db7ef6acd41
235	Plus One	Math & Geometry	easy	https://leetcode.com/problems/plus-one/	neetcode	c0fed251-b1f0-4de4-97ae-786053b385ec
236	Two Sum	Pointers	easy	https://leetcode.com/problems/two-sum/	capstone	8fc2cba5-a92c-4505-bc45-ec8b18cca957
237	Valid Palindrome	Pointers	easy	https://leetcode.com/problems/valid-palindrome/	capstone	106c9159-a401-423e-ac6a-630792bf15d8
238	Reverse String	Pointers	easy	https://leetcode.com/problems/reverse-string/	capstone	2b3fbe5b-da06-4c3b-a987-426bfb6a6d9b
239	Is Subsequence	Pointers	easy	https://leetcode.com/problems/is-subsequence/	capstone	18b7d8b3-71e0-41a6-86d9-8c69a4d656d8
240	Remove Duplicates from Sorted Array	Pointers	easy	https://leetcode.com/problems/remove-duplicates-from-sorted-array/	capstone	76118cc0-b425-4a92-af36-a61192658d67
241	Move Zeroes	Pointers	easy	https://leetcode.com/problems/move-zeroes/	capstone	a589ea7b-7077-40bc-81ba-313bcf981956
242	Valid Palindrome II	Pointers	easy	https://leetcode.com/problems/valid-palindrome-ii/	capstone	33ad6f20-747a-4c00-8255-2263780a2f93
243	Intersection of Two Arrays	Pointers	easy	https://leetcode.com/problems/intersection-of-two-arrays/	capstone	092be7dc-c45b-4bad-8765-823ad3931fb8
244	Merge Sorted Array	Pointers	easy	https://leetcode.com/problems/merge-sorted-array/	capstone	fd3d1a0c-fc4a-46e4-9f6c-eb7c0d79324c
245	Best Time to Buy & Sell Stock	Sliding Window	easy	https://leetcode.com/problems/best-time-to-buy-and-sell-stock/	neetcode	755bfd66-f840-42b5-b574-cd0e2ab4f259
246	Valid Parentheses	Stack	easy	https://leetcode.com/problems/valid-parentheses/	capstone	43248c8d-dc4b-4465-bdd1-066649001c43
247	Balanced Binary Tree	Trees	easy	https://leetcode.com/problems/balanced-binary-tree/	capstone	ed93270c-ff7b-4213-97e2-e872ebfd763c
248	Invert Binary Tree	Trees	easy	https://leetcode.com/problems/invert-binary-tree/	capstone	8d182b97-bb0e-4b0d-b1ce-c155f23841ac
249	Maximum Depth of Binary Tree	Trees	easy	https://leetcode.com/problems/maximum-depth-of-binary-tree/	capstone	bff73a8a-e2c4-41f6-817d-9408fd2ec3d4
250	Same Tree	Trees	easy	https://leetcode.com/problems/same-tree/	capstone	4aed69f2-af87-443d-b181-504967f3a686
251	Range Sum of BST	Trees	easy	https://leetcode.com/problems/range-sum-of-bst/	capstone	c3997d84-5833-4b22-aa0c-7790ef122645
252	Binary Tree Preorder Traversal	Trees	easy	https://leetcode.com/problems/binary-tree-preorder-traversal	capstone	fbabe3ff-0257-40b0-9146-9ba2b4b9fc94
253	Diameter of a Binary Tree	Trees	easy	https://leetcode.com/problems/diameter-of-binary-tree/	neetcode	889cebd1-cd54-44ba-86a2-f3aea20d2fc7
254	Lowest Common Ancestor of a BST	Trees	easy	https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/	neetcode	7e224e66-4de2-40d9-97a1-a82177af5743
255	Subtree of Another Tree	Trees	easy	https://leetcode.com/problems/subtree-of-another-tree/	neetcode	dba4ed0b-e64c-46dc-9067-efaaf3deb115
256	Symmetric Tree	Trees	easy	https://leetcode.com/problems/symmetric-tree/	capstone	2af80812-d1bc-40db-9641-3c66b0c63f06
257	Alien Dictionary	Advanced Graphs	hard	https://leetcode.com/problems/alien-dictionary/	neetcode	00fb27da-8a3e-40e7-837d-13b040998a8d
258	Reconstruct Itinerary	Advanced Graphs	hard	https://leetcode.com/problems/reconstruct-itinerary/	neetcode	2509190d-48ec-4b87-9885-fc105af78037
259	Swim in Rising Water	Advanced Graphs	hard	https://leetcode.com/problems/swim-in-rising-water/	neetcode	f0f6c279-ae1c-4ce6-a574-1f567d26b5ff
260	N-Queens	Backtracking	hard	https://leetcode.com/problems/n-queens/	neetcode	d11539b0-e18c-42c8-8f54-290bb23a1f82
261	Find Median of Two Sorted Arrays	Binary Search	hard	https://leetcode.com/problems/median-of-two-sorted-arrays/	neetcode	4ccbfafd-d7f4-42f8-b6d1-0ee9e6396795
262	Burst Balloons	Dynamic Programming	hard	https://leetcode.com/problems/burst-balloons/	neetcode	b3caa860-ba15-49a2-804d-9ebf060408f3
263	Distinct Subsequences	Dynamic Programming	hard	https://leetcode.com/problems/distinct-subsequences/	neetcode	b17a04bd-614a-45d0-9a94-ebb3a6fc4f52
264	Edit Distance	Dynamic Programming	hard	https://leetcode.com/problems/edit-distance/	neetcode	54d7f992-7ed0-411f-b43c-b278de93e6e0
265	Longest Increasing Path in a Matrix	Dynamic Programming	hard	https://leetcode.com/problems/longest-increasing-path-in-a-matrix/	neetcode	8d45db3a-6517-4d54-bc86-d180c9fdee32
266	Regular Expression Matching	Dynamic Programming	hard	https://leetcode.com/problems/regular-expression-matching/	neetcode	95dff9ee-bf6f-4396-acae-7ae9c51a4c63
267	Longest Consecutive Sequence	Graphs	hard	https://leetcode.com/problems/longest-consecutive-sequence/	neetcode	e189c534-1187-4b99-a577-1e3c4d42485a
268	Word Ladder	Graphs	hard	https://leetcode.com/problems/word-ladder/	neetcode	f7a2b1c8-8600-48f2-97e7-210dab442707
269	Find Median from Data Stream	Heap / Priority Queue	hard	https://leetcode.com/problems/find-median-from-data-stream/	neetcode	41ca7afa-09da-4d11-89d7-f3d5e0df39bd
270	Minimum Interval to Include Each Query	Intervals	hard	https://leetcode.com/problems/minimum-interval-to-include-each-query/	neetcode	2b5da81e-4159-4ba1-977e-5ec0ffa8d84b
271	Merge K Sorted Lists	Linked List	hard	https://leetcode.com/problems/merge-k-sorted-lists/	neetcode	1be8a7f7-6856-49bc-b794-0dda32ff9d0f
272	Reverse Nodes in K-Group	Linked List	hard	https://leetcode.com/problems/reverse-nodes-in-k-group/	neetcode	71b1adaf-a285-417f-b534-3ee74304953c
273	Trapping Rain Water	Pointers	hard	https://leetcode.com/problems/trapping-rain-water/	neetcode	770b419f-8fee-43ad-9f4b-4fa3242cc280
274	Minimum Window Substring	Sliding Window	hard	https://leetcode.com/problems/minimum-window-substring/	neetcode	e4e49898-f462-4e62-8ac6-59a285ffb383
275	Sliding Window Maximum	Sliding Window	hard	https://leetcode.com/problems/sliding-window-maximum/	neetcode	89e5df9e-80c4-4a7b-8f4d-e1dbdc20569d
276	Largest Rectangle in Histogram	Stack	hard	https://leetcode.com/problems/largest-rectangle-in-histogram/	neetcode	11b5c756-d4a2-4c56-bd95-dc001eca428a
277	Binary Tree Max Path Sum	Trees	hard	https://leetcode.com/problems/binary-tree-maximum-path-sum/	neetcode	19efd329-04bc-4193-a0e5-53e06d1fe179
278	Serialize and Deserialize Binary Tree	Trees	hard	https://leetcode.com/problems/serialize-and-deserialize-binary-tree/	neetcode	530833e0-9660-4c7f-9120-e17f2e8548ea
279	Word Search II	Tries	hard	https://leetcode.com/problems/word-search-ii/	neetcode	9e54462c-12d3-4a66-b6dd-f197b8e1013e
280	Cheapest Flights with K Stops	Advanced Graphs	medium	https://leetcode.com/problems/cheapest-flights-within-k-stops/	neetcode	23d43b77-5c8b-4c0c-ab93-15e906a552c7
281	Min Cost to Connect all Points	Advanced Graphs	medium	https://leetcode.com/problems/min-cost-to-connect-all-points/	neetcode	82d50397-7c7f-4d3c-81d9-1776f10fd06a
282	Network Delay Time	Advanced Graphs	medium	https://leetcode.com/problems/network-delay-time/	neetcode	a366b72e-7315-41f6-a7de-ed7b68a183cb
283	Group Anagrams	Arrays	medium	https://leetcode.com/problems/group-anagrams/	neetcode	65b9871f-475f-4644-88dd-09a5ab263047
284	Product of Array Except Self	Arrays	medium	https://leetcode.com/problems/product-of-array-except-self/	neetcode	0d2a232b-c4cd-4753-bfa6-6fd001575e09
285	Top K Frequent Elements	Arrays	medium	https://leetcode.com/problems/top-k-frequent-elements/	neetcode	781e52f3-533b-43ee-9fea-4b987511565e
286	Valid Sudoku	Arrays	medium	https://leetcode.com/problems/valid-sudoku/	neetcode	27759274-25e8-4f3e-9d26-540fb1957637
287	Combination Sum II	Backtracking	medium	https://leetcode.com/problems/combination-sum-ii/	neetcode	98c332a9-c985-42ae-b68e-e26ae9801e61
288	Combination Sum	Backtracking	medium	https://leetcode.com/problems/combination-sum/	capstone	75694e68-43e2-471c-bd60-002dc3212fbb
289	Letter Combinations of a Phone Number	Backtracking	medium	https://leetcode.com/problems/letter-combinations-of-a-phone-number/	neetcode	06ed8433-0efb-40ce-b58c-2b96917633b8
290	Palindrome Partitioning	Backtracking	medium	https://leetcode.com/problems/palindrome-partitioning/	capstone	41942ed5-f4ea-424e-92ab-f9e2795407ec
291	Permutations	Backtracking	medium	https://leetcode.com/problems/permutations/	capstone	8a41b456-d80d-4427-8b7f-807ca8c7c909
292	Subsets II	Backtracking	medium	https://leetcode.com/problems/subsets-ii/	neetcode	5c23e4c5-993e-422b-b1a7-2ef8d6e52d69
293	Subsets	Backtracking	medium	https://leetcode.com/problems/subsets/	capstone	bc7982cc-c16a-499e-83d4-8ba83d7fee70
294	Word Search	Backtracking	medium	https://leetcode.com/problems/word-search/	neetcode	8e62f290-be52-428d-9c5e-450fe3b3f18a
295	Combinations	Backtracking	medium	https://leetcode.com/problems/combinations/	capstone	51942451-c49b-434a-b669-6b8855556e2a
296	Find Minimum in Rotated Sorted Array	Binary Search	medium	https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/	capstone	145cef7b-8586-4bbc-89f0-c1bf0bff7262
297	Koko Eating Bananas	Binary Search	medium	https://leetcode.com/problems/koko-eating-bananas/	neetcode	7388b910-67fe-4e38-a75b-aafe39f218e2
298	Search a 2D Matrix	Binary Search	medium	https://leetcode.com/problems/search-a-2d-matrix/	capstone	867cf4ce-bddf-474b-9741-e302a19bd0b0
299	Search Rotated Sorted Array	Binary Search	medium	https://leetcode.com/problems/search-in-rotated-sorted-array/	capstone	56c7c7de-45d8-4a5e-96fe-108b7f5a4010
300	Time Based Key-Value Store	Binary Search	medium	https://leetcode.com/problems/time-based-key-value-store/	neetcode	be6acf8e-eb7c-4216-ae58-0553cbfee8c4
301	Find First and Last Position of Element in Sorted Array	Binary Search	medium	https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/	capstone	ce5516f7-ee0f-475f-bf1b-14d93c123eaf
302	Find Peak Element	Binary Search	medium	https://leetcode.com/problems/find-peak-element/	capstone	b7b83905-65ca-4592-9d45-29fd7f6db1c2
303	Reverse Integer	Bit Manipulation	medium	https://leetcode.com/problems/reverse-integer/	neetcode	dbca3b42-48bf-4033-b032-c53ffb624e2b
304	Sum of Two Integers	Bit Manipulation	medium	https://leetcode.com/problems/sum-of-two-integers/	neetcode	d0d58b86-0065-4089-9e5b-f069505bc87a
305	Coin Change	Dynamic Programming	medium	https://leetcode.com/problems/coin-change/	capstone	825867de-df39-4f3d-b83d-be3c42c8a2ea
306	House Robber	Dynamic Programming	medium	https://leetcode.com/problems/house-robber/	capstone	3f3ff5f8-57ef-4141-8896-2302a4298d85
307	Word Break	Dynamic Programming	medium	https://leetcode.com/problems/word-break/	capstone	d527dab7-e558-46f5-96a4-ac53b4b351d6
308	Longest Common Subsequence	Dynamic Programming	medium	https://leetcode.com/problems/longest-common-subsequence/	capstone	ee12caa2-ca35-44be-a40f-cd4baf316c45
309	Unique Paths	Dynamic Programming	medium	https://leetcode.com/problems/unique-paths/	capstone	e37da447-cc3f-4c9a-af24-76f4e4b11a36
310	Unique Paths II	Dynamic Programming	medium	https://leetcode.com/problems/unique-paths-ii/	capstone	b5fcc7ff-5ff0-462d-8444-e256220e1dae
311	Triangle	Dynamic Programming	medium	https://leetcode.com/problems/triangle/	capstone	132b9b26-fa71-4e82-a4e0-7acfc3c38805
312	Minimum Path Sum	Dynamic Programming	medium	https://leetcode.com/problems/minimum-path-sum/	capstone	ec32ef6f-e1ed-421d-8881-f39729a452fe
313	Jump Game	Dynamic Programming	medium	https://leetcode.com/problems/jump-game/	capstone	1a5c049a-be2e-49c6-a676-35bda49366f4
314	Decode Ways	Dynamic Programming	medium	https://leetcode.com/problems/decode-ways/	neetcode	19e67e1a-10cc-4f97-b0c9-deeb47fac302
315	House Robber II	Dynamic Programming	medium	https://leetcode.com/problems/house-robber-ii/	neetcode	a99d92de-969b-464d-b57a-c29f1055f45a
316	Longest Increasing Subsequence	Dynamic Programming	medium	https://leetcode.com/problems/longest-increasing-subsequence/	neetcode	034437c3-e1fa-4ce9-8cfe-cadf6c0a7673
317	Longest Palindroming Substring	Dynamic Programming	medium	https://leetcode.com/problems/longest-palindromic-substring/	neetcode	79de85f6-0cb7-4790-b7a9-7da320220520
318	Maximum Product Subarray	Dynamic Programming	medium	https://leetcode.com/problems/maximum-product-subarray/	neetcode	b48475ca-1bf1-4da2-9701-22b08ee6cd62
319	Palindrome Substrings	Dynamic Programming	medium	https://leetcode.com/problems/palindromic-substrings/	neetcode	475ecbba-f785-4fa4-953e-387c599d723d
320	Partition Equal Subset Sum	Dynamic Programming	medium	https://leetcode.com/problems/partition-equal-subset-sum/	neetcode	b368e7ca-80d0-472a-b6bc-aa7b67914920
321	Best Time to Buy/Sell Stock With Cooldown	Dynamic Programming	medium	https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/	neetcode	e7c3fd5a-81e1-4f71-be6b-b68a52d3aa25
322	Coin Change II	Dynamic Programming	medium	https://leetcode.com/problems/coin-change-2/	neetcode	e5acec39-0abd-4d2f-b2b1-976bdf27b808
323	Interleaving String	Dynamic Programming	medium	https://leetcode.com/problems/interleaving-string/	neetcode	8a6187b2-ed39-4893-809d-c726d9f42993
324	Target Sum	Dynamic Programming	medium	https://leetcode.com/problems/target-sum/	neetcode	8d273220-317f-4f48-89e1-bd47241dff8e
325	Jump Game II	Dynamic Programming	medium	https://leetcode.com/problems/jump-game-ii/	neetcode	0306b25a-9f19-4cc8-ac91-886686989c5b
326	Find the Index of the First Occurrence in a String	General	medium	https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/	capstone	d7df47d9-d343-48b5-9826-1b68d7ecd608
327	Spiral Matrix	General	medium	https://leetcode.com/problems/spiral-matrix/	capstone	f99313f1-41d8-4b3d-9af9-d319aa092e86
328	Clone Graph	Graphs	medium	https://leetcode.com/problems/clone-graph/	neetcode	e34f1a0e-0f2d-471e-8c7c-0434cd6b894f
329	Course Schedule II	Graphs	medium	https://leetcode.com/problems/course-schedule-ii/	neetcode	229c9601-e565-4e74-92e3-5a34269a9f9a
330	Course Schedule	Graphs	medium	https://leetcode.com/problems/course-schedule/	neetcode	042b7c76-9903-4eda-93ce-946caa263bfd
331	Graph Valid Tree	Graphs	medium	https://leetcode.com/problems/graph-valid-tree/	neetcode	73b66fa7-9ec8-448f-8373-7b1388838497
332	Max Area of Island	Graphs	medium	https://leetcode.com/problems/max-area-of-island/	neetcode	dd7d4106-2449-4367-8ab2-03fa424a8417
333	Number of Connected Components in Graph	Graphs	medium	https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/	neetcode	275bc337-4306-4749-8f7f-4d215b478b52
334	Number of Islands	Graphs	medium	https://leetcode.com/problems/number-of-islands/	neetcode	9b698c04-c8d0-4ff2-9cdc-fbfa855e42e8
335	Pacific Atlantic Waterflow	Graphs	medium	https://leetcode.com/problems/pacific-atlantic-water-flow/	neetcode	59fbd1ba-5968-496c-8af6-12cfd298c27d
336	Redundant Connection	Graphs	medium	https://leetcode.com/problems/redundant-connection/	neetcode	1b677489-4965-4ad1-ab97-a0703da132d2
337	Rotting Oranges	Graphs	medium	https://leetcode.com/problems/rotting-oranges/	neetcode	69edcdb2-144b-4e5f-a7a8-4fa938b7ad54
338	Surrounded Regions	Graphs	medium	https://leetcode.com/problems/surrounded-regions/	neetcode	8438df65-c492-41f8-bb3f-33635ebbeeae
339	Walls and Gates	Graphs	medium	https://leetcode.com/problems/walls-and-gates/	neetcode	365ac4f7-9f7e-4240-80a7-9f4872247800
340	Gas Station	Greedy	medium	https://leetcode.com/problems/gas-station/	neetcode	5455ea39-989e-4144-970d-58b9728cfe3c
341	Hand of Straights	Greedy	medium	https://leetcode.com/problems/hand-of-straights/	neetcode	f312ea13-efe5-4a4b-aced-467455420509
342	Merge Triplets to Form Target Triplet	Greedy	medium	https://leetcode.com/problems/merge-triplets-to-form-target-triplet/	neetcode	48bd81a2-7395-4d32-a7e3-df091d361f72
343	Partition Labels	Greedy	medium	https://leetcode.com/problems/partition-labels/	neetcode	02625b93-feec-40e5-8397-d8435d7dfa08
344	Valid Parenthesis String	Greedy	medium	https://leetcode.com/problems/valid-parenthesis-string/	neetcode	e7ba07b2-7186-4933-b8a9-80144b7ca323
345	Design Twitter	Heap / Priority Queue	medium	https://leetcode.com/problems/design-twitter/	neetcode	3946f94b-06e2-4fd1-a1a9-25e79e4f91dc
346	K Closest Points to Origin	Heap / Priority Queue	medium	https://leetcode.com/problems/k-closest-points-to-origin/	neetcode	8890ee06-11ee-4bb5-b8b5-4c752b0982c8
347	Kth Largest Element in an Array	Heap / Priority Queue	medium	https://leetcode.com/problems/kth-largest-element-in-an-array/	neetcode	e99e81b9-ae9c-4129-a354-98b37c070d26
348	Task Scheduler	Heap / Priority Queue	medium	https://leetcode.com/problems/task-scheduler/	neetcode	e1ad85b2-5349-4fc4-af37-d59338140c84
349	Insert Interval	Intervals	medium	https://leetcode.com/problems/insert-interval/	neetcode	48030014-5ec0-4da7-a60f-29291e399287
350	Meeting Rooms II	Intervals	medium	https://leetcode.com/problems/meeting-rooms-ii/	neetcode	06d301cb-704e-453c-87b7-9cbab9ef2053
351	Merge Intervals	Intervals	medium	https://leetcode.com/problems/merge-intervals/	capstone	d334c4bf-939a-4ecf-9b26-e03029fd9c37
352	Non-Overlapping Intervals	Intervals	medium	https://leetcode.com/problems/non-overlapping-intervals/	neetcode	dbeb80a0-1d28-44d9-904e-a931501eac31
353	Add Two Numbers	Linked List	medium	https://leetcode.com/problems/add-two-numbers/	capstone	5826d568-888f-4ee1-8fa6-528fd04b10c1
354	Copy List with Random Pointer	Linked List	medium	https://leetcode.com/problems/copy-list-with-random-pointer/	neetcode	cd7dc3c2-bc20-4193-a053-7bb65b335be2
355	Find the Duplicate Number	Linked List	medium	https://leetcode.com/problems/find-the-duplicate-number/	neetcode	4f7e071d-5421-45c6-b412-8e1dd3a5a651
356	LRU Cache	Linked List	medium	https://leetcode.com/problems/lru-cache/	neetcode	ee24b113-6a71-423a-84ae-ba5aac687eca
357	Remove Nth Node from End of List	Linked List	medium	https://leetcode.com/problems/remove-nth-node-from-end-of-list/	capstone	6fb272d1-a2fc-46a7-9d84-cf888928d12c
358	Reorder List	Linked List	medium	https://leetcode.com/problems/reorder-list/	neetcode	69aaf6dc-39c8-422e-a6a6-fe819e71dbb7
359	Remove Duplicates from Sorted List II	Linked List	medium	https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/	capstone	3ba64826-fb03-40e7-9dd4-45669b22f377
360	Reverse Linked List II	Linked List	medium	https://leetcode.com/problems/reverse-linked-list-ii/	capstone	c6ea4d1d-c5c3-42bb-b83f-02afe8699862
361	Delete Node in a Linked List	Linked List	medium	https://leetcode.com/problems/delete-node-in-a-linked-list/	capstone	0dafb12f-5946-47f4-a60a-c281a7642572
362	Odd Even Linked List	Linked List	medium	https://leetcode.com/problems/odd-even-linked-list/	capstone	87e23a2d-73f7-4e1f-96e1-d36589bae930
363	Detect Squares	Math & Geometry	medium	https://leetcode.com/problems/detect-squares/	neetcode	65442ee5-bdd4-4560-9278-0c69199a19ee
364	Multiply Strings	Math & Geometry	medium	https://leetcode.com/problems/multiply-strings/	neetcode	0afc743f-4bd5-449a-8052-ebfdd78f69c4
365	Pow(x, n)	Math & Geometry	medium	https://leetcode.com/problems/powx-n/	neetcode	69603725-8822-4c64-a911-487a5df1cce4
366	Rotate Image	Math & Geometry	medium	https://leetcode.com/problems/rotate-image/	neetcode	96fe8c21-dbe0-42a9-ba3d-e15eea7d39f3
367	Set Matrix Zeroes	Math & Geometry	medium	https://leetcode.com/problems/set-matrix-zeroes/	neetcode	ae9e4f22-dd76-447e-bf47-51d8249cbd05
368	3Sum	Pointers	medium	https://leetcode.com/problems/3sum/	capstone	ad02abc4-2294-4026-949f-9fb897c78790
369	Container with Most Water	Pointers	medium	https://leetcode.com/problems/container-with-most-water/	neetcode	181a97aa-f1ef-410b-bb2c-e0af15d7a010
370	Two Sum II	Pointers	medium	https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/	capstone	39a3b4b3-1983-47ef-8a67-fc42427413dd
371	Minimum Size Subarray Sum	Pointers	medium	https://leetcode.com/problems/minimum-size-subarray-sum/	capstone	f89f2504-ea53-46e0-900d-5d98036ab1b9
372	Maximum Subarray	Recursion	medium	https://leetcode.com/problems/maximum-subarray/	capstone	c34c613c-7cba-4fad-9530-b0720d2dccfc
373	Longest Repeating Character Replacement	Sliding Window	medium	https://leetcode.com/problems/longest-repeating-character-replacement/	neetcode	048e0250-1f5c-4a2e-b889-9378704d67ea
374	Longest Substring Without Repeating Characters	Sliding Window	medium	https://leetcode.com/problems/longest-substring-without-repeating-characters/	neetcode	ceab16bb-019a-4938-b464-de140557d5de
375	Permutation in String	Sliding Window	medium	https://leetcode.com/problems/permutation-in-string/	neetcode	a53704a6-37f8-4148-ad28-968ea100d1c9
376	Car Fleet	Stack	medium	https://leetcode.com/problems/car-fleet/	neetcode	a22dce0b-1fc2-4426-8e2d-b954302d39f6
377	Daily Temperatures	Stack	medium	https://leetcode.com/problems/daily-temperatures/	neetcode	2126c1e1-4a8a-4e22-9b8a-3022cbb3a647
378	Evaluate Reverse Polish Notation	Stack	medium	https://leetcode.com/problems/evaluate-reverse-polish-notation/	neetcode	a79ba85e-948f-45c5-b94e-64a0b70f98e6
379	Generate Parentheses	Stack	medium	https://leetcode.com/problems/generate-parentheses/	neetcode	7bf76e6f-01be-42d3-b85e-471c4b6daa6b
380	Min Stack	Stack	medium	https://leetcode.com/problems/min-stack/	neetcode	3a8123bf-b763-4997-88f0-c8610abc7909
381	Simplify Path	Stack	medium	https://leetcode.com/problems/simplify-path/	capstone	2f74068b-4117-41dd-828c-26600f2f598c
382	Basic Calculator II	Stack	medium	https://leetcode.com/problems/basic-calculator-ii/	capstone	e4996541-e29d-46f3-9bb0-063e19fd6b42
383	Binary Tree Level Order Traversal	Trees	medium	https://leetcode.com/problems/binary-tree-level-order-traversal/	capstone	c013c1dd-d60c-48b3-88ad-e66e618870f5
384	Validate Binary Search Tree	Trees	medium	https://leetcode.com/problems/validate-binary-search-tree/	capstone	4ac0692c-aa22-4902-96ba-51bc884a7d4f
385	Flatten Binary Tree to Linked List	Trees	medium	https://leetcode.com/problems/flatten-binary-tree-to-linked-list/	capstone	d6c8a5eb-87f6-4a0c-b572-7df1b5bc6653
386	Sum Root to Leaf Numbers	Trees	medium	https://leetcode.com/problems/sum-root-to-leaf-numbers	capstone	0604d723-b463-44fa-a659-188e2656dd68
387	Binary Tree Right Side View	Trees	medium	https://leetcode.com/problems/binary-tree-right-side-view/	neetcode	d4093cac-fd0b-402a-bf9e-a8bf8e57afd3
388	Construct Tree from Preorder and Inorder Traversal	Trees	medium	https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/	neetcode	2feae364-7149-497b-8140-5b263eb5c5df
389	Count Good Nodes in a Binary Tree	Trees	medium	https://leetcode.com/problems/count-good-nodes-in-binary-tree/	neetcode	386012a1-408a-49cb-9649-93f69ca3e106
390	Kth Smallest Element in a BST	Trees	medium	https://leetcode.com/problems/kth-smallest-element-in-a-bst/	neetcode	cd691300-1f66-45e4-ae98-d23b857358cc
391	Design Add and Search Word Data Structure	Tries	medium	https://leetcode.com/problems/design-add-and-search-words-data-structure/	neetcode	63213306-f0fa-4725-91c4-92bab0ab01ab
392	Implement Trie	Tries	medium	https://leetcode.com/problems/implement-trie-prefix-tree/	neetcode	911a5fa2-7ce8-4767-b452-8c33a8cc1f22
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
8539f4bc-d935-4d08-852e-621ea4e80ec2	121c387c78b899554ee5e32093bea2c9f89d623232e27317d7ab9d5b51b87aba	2023-01-16 15:09:23.725199-08	20230115164109_init	\N	\N	2023-01-16 15:09:23.721706-08	1
e54e8843-df0c-4aab-8212-2297dfc7af34	f2403e173b1d25408ef37278fd196c3498116b82db300dc94b2cc40222640a62	2023-01-16 15:09:23.726733-08	20230116010005_added_source	\N	\N	2023-01-16 15:09:23.725507-08	1
cb027808-7b7b-4eeb-a572-f553dba491c0	03551fa555c77afbbea0d3b7d7f5894a05d1652158df2e093bf488b58db37ed2	2023-01-16 15:09:23.731264-08	20230116010542_made_difficulty_lowercase	\N	\N	2023-01-16 15:09:23.727071-08	1
a104ede6-30bb-4209-aadc-bce56132d1f4	3966f02f14706cb9cafdfbdb61e61a568c4749a29be15e2b2dd45958dc9c8c6d	2023-01-16 15:09:37.960962-08	20230116230937_add_problem_id_as_secondary_index	\N	\N	2023-01-16 15:09:37.957098-08	1
7ae5c3f0-c6d8-4cbd-a510-7dd69faccd02	bbf7634d794e7d4807bbf79b4d65ca86bd82c31737bfcf07399fd0de0e59ed72	2023-01-16 17:43:28.090384-08	20230117014328_make_problem_id_unique	\N	\N	2023-01-16 17:43:28.087582-08	1
\.


--
-- Name: Problem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Problem_id_seq"', 392, true);


--
-- Name: Problem Problem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Problem"
    ADD CONSTRAINT "Problem_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Problem_problem_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Problem_problem_id_idx" ON public."Problem" USING btree (problem_id);


--
-- Name: Problem_problem_id_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Problem_problem_id_key" ON public."Problem" USING btree (problem_id);


--
-- PostgreSQL database dump complete
--

