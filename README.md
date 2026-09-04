# KG-Kernel

KG-Kernel is a graph-native, self-describing meta-model for building domain-specific ontologies. It defines the small set of foundational node and relation types you need in order to describe *any* domain, then lets that domain's own classes and instance data live in the same knowledge graph — governed, traceable, and queryable together instead of scattered across separate docs, spreadsheets, and code comments.

"Self-describing" is literal, not a slogan: every meta-class in [kg-kernel.cypher](kg-kernel.cypher) carries its own `text` property explaining what it means and what question it answers. The kernel documents itself inside the graph rather than in a wiki that drifts out of sync with it.

## Why a kernel at all?

Knowledge graphs built by loosely extracting entities and relations — from documents, from an LLM, from ad-hoc scripts — tend to become **spaghetti graphs**: every source invents its own labels, the same real-world thing shows up under three different names, and nothing constrains what can connect to what. They're hard to query with confidence and impossible to explain to a newcomer.

KG-Kernel's answer is to fix a small, stable **meta-ontology** up front — the rules for what counts as a "thing," a "relation," or a "property" — so that every domain built on top of it is governed and self-consistent by construction, instead of governed after the fact by cleanup.

## The three layers

KG-Kernel assumes and enables a three-layer architecture. Each layer is a set of nodes and relations in the *same* graph, kept distinct by layer-specific labels, with explicit cross-layer relationships (like `ONTOLOGY_HAS_TYPE` and `INSTANCE_OF`) linking them:

| Layer | Answers | Example labels |
|---|---|---|
| **1. Meta Ontology** (this repo) | What is a "thing" or "relation," in general, for *any* domain? | `Ontology`, `Ontology_Entity`, `Ontology_Relation`, `Ontology_Property` |
| **2. Domain Ontology** | What kinds of things and connections matter *in this domain*? | e.g. `Requirement`, `Asset`, `SATISFIES` for an assurance domain |
| **3. Domain Instances** | What actually exists, right now, in the real world? | e.g. a specific requirement, a specific certificate |

This separation matters because it splits knowledge modeling into two distinct, sequential phases: first describe the domain in general — the types of things and relations that matter — as a Domain Ontology; then populate real Domain Instances against that description. **KG-Kernel itself only defines layer 1** — the rules for building and maintaining a Domain Ontology. What any particular domain ontology actually contains (assurance, construction, biology, anything) is out of scope for the kernel; that's the next layer's job.

## Multiple domains, one graph

Because layer 2 is "a domain ontology" rather than "the domain ontology," a single graph built on KG-Kernel can hold several domain ontologies side by side, each tagged back to the meta layer via `Ontology_Domain`. They don't need to be merged into one master schema to coexist — they just need to share the same layer-1 rules for what an entity, relation, and property are. That shared foundation is what makes it possible to traverse *across* domains with the same query patterns you'd use *within* one, instead of needing a bespoke integration per pair of domains.

A more professional example: a construction project isn't one domain, it's several overlaid on the same set of physical things. A single wall might be described from an **aesthetics** domain (finish, color), a **materials** domain (concrete grade, supplier), a **safety** domain (fire rating, hazard controls), and an **assurance** domain (which requirement it satisfies, what evidence certifies it) — all as separate domain ontologies, all pointing at the same underlying entity in the graph. A traversal like "show me everything connected to this wall" then naturally surfaces its finish, its material spec, its fire rating, and its certification in one pass, because every domain was built on the same layer-1 vocabulary of entities, relations, and properties rather than four incompatible schemas bolted together after the fact.

## A simple example

Imagine you're building a guide to a zoo.

- **Meta Ontology** is the rulebook that says: *"A zoo guide is made of animals, the places they live, and the connections between them — like which animal lives where."* It doesn't mention lions or cages at all. It would work equally well for a guide to a school, a kitchen, or a football team.
- **Domain Ontology** is what you get when you apply that rulebook to zoos specifically: you decide the animal kingdom domain needs a class called `Animal`, a class called `Habitat`, and a relation called `LIVES_IN` connecting them.
- **Domain Instances** are the actual entries in your finished guide: `Leo` (an instance of `Animal`) `LIVES_IN` `Savannah Exhibit` (an instance of `Habitat`).

Notice each layer only needs the layer below it to make sense: you can't have "Leo lives in the Savannah Exhibit" without first deciding that "animals" and "living in a place" are things worth describing — and you can't decide that without first agreeing, in general, that a guide is made of things and connections between things. That's exactly the `Ontology_Entity` → `Ontology_Relation` distinction the kernel fixes at layer 1, so every domain ontology built on it — zoos or otherwise — reuses the same rulebook.

## What's in the meta-ontology

[kg-kernel.cypher](kg-kernel.cypher) currently defines 11 meta-classes and 4 meta-relations, all rooted under a single `Ontology` node (every ontology has exactly one):

| Meta-class | Answers |
|---|---|
| `Ontology_Domain` | Which discipline or subject matter does this belong to? |
| `Ontology_Concept` | What does this mean? |
| `Ontology_Lifecycle` / `Ontology_Lifecycle_Stage` | In what time-related stages do events occur? |
| `Ontology_Process` / `Ontology_Process_Activity` | How are things created? |
| `Ontology_Entity` | What exists? |
| `Ontology_Relation` | How may things connect? |
| `Ontology_Property` | What attributes may be recorded? |
| `Ontology_Pattern` | What reusable graph structures exist, and what do they mean? |

One deliberate design choice worth calling out: relations are modeled as `Ontology_Relation` **nodes**, not just Cypher relationship types — even the meta-relations (`ONTOLOGY_HAS_PART`, `ONTOLOGY_HAS_TYPE`, `ONTOLOGY_HAS_PROPERTY`, `IS_SUPERSEDED_BY`) are defined this way. That's what lets a relation carry its own documentation and lifecycle (`created_on` / `superseded_on`) exactly like an entity can, keeping the "self-describing" property consistent across the whole kernel.

## Status

Early stage — the kernel currently defines the meta-class vocabulary; domain ontologies and cross-layer relationship patterns are still being built out.

## Related writing

More background and worked examples on this approach are on the author's blog at [nedev.digital](https://nedev.digital), including the [Assurance Knowledge Platform Ontology Architecture Specification](https://nedev.digital/blog/posts/ontology-architecture), which applies this same three-layer pattern to a real domain.
