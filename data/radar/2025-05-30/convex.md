---
title: "Convex"
ring: assess
quadrant: platforms-and-operations
tags: [realtime, database, backend-as-a-service, typescript, reactive]
featured: true
---

**Reason for selection**

Convex promises to collapse our current "Supabase + Drizzle + tRPC + TanStack Query" pyramid into a single code-first backend. Queries are TypeScript, live by default, and run within the datastore; local dev is a one-liner with no Docker orchestration. A self-host option on Fly/Docker eases vendor-lock anxiety. If the claims hold up, Convex could greatly simplify new-project bootstrapping and reduce full-stack cognitive load.

**Key questions**

- How reliable and scalable is the reactive query engine under real-world load?  
- What is the DX of modelling relational data and auth without SQL?  
- Total cost of ownership vs Supabase + edge functions once traffic scales?  
- Can we layer fine-grained RLS / multi-tenant rules cleanly?  
- Migration path back to PostgreSQL if we outgrow Convex?  
- How painful is self-hosting and upgrades?  

**Assessment approach**

1. Spin up a demo in the *mo-stack*: Auth (Clerk), CRUD screens, optimistic updates, file uploads.  
2. Benchmark latency and subscription fan-out with a Locust script.  
3. Compare authoring effort and lines of code with an equivalent Supabase-Drizzle prototype.  
4. Test self-hosting on Fly.io and Docker compose; document pitfalls.  
5. Hold a dev-experience retro and decide whether to promote, iterate or drop.  

**Potential testers**

- Cam (lead), two full-stack volunteers, one mobile engineer for React Native SDK.

**Notes**

Convex's new **native auth** is still beta and lacks advanced rules; we will pair with Clerk/Auth0. Long-term viability should be tracked.