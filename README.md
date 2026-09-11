# KG-Kernel

KG-Kernel is a self-explaining, graph-based semantic kernel for building networks of reusable, application-specific ontologies and the knowledge graphs they govern. It defines the fundamental constructs for describing the knowledge necessary for an application — not a universal model of everything — so an application can explicitly model the domain semantics that actually matter to it, reusing and combining ontology modules at whatever depth it needs, while relying on general-purpose knowledge everywhere else. The resulting ontology network becomes a persistent semantic frame of reference: something an LLM can interpret, retrieve against, construct from, and be checked against — instead of inventing its own schema and meaning, differently, every time.

"Self-explaining" is literal, not a slogan: every meta-class in [kg-kernel.cypher](kg-kernel.cypher) carries its own `text` property explaining what it means and what question it answers, right there in the graph. Concepts, relations, properties, and patterns are all first-class graph elements — nodes you can query and inspect, not names buried in a separate schema file.

## Aim

KG-Kernel exists to provide a persistent, reusable semantic control plane between an application and an LLM: a machine-readable ontology network that explicitly captures the application-specific meaning that must remain stable, while allowing the LLM to supply general knowledge outside that boundary. The result should be a **human-verifiable knowledge graph** — one a person can inspect and trust the meaning of — as opposed to a ["spaghetti graph"](https://nedev.digital/blog/posts/ontology-architecture), where ungoverned extraction leaves labels ambiguous and inconsistent.

## Design principles

1. **Graph-based** — the kernel, every ontology module, and all instance data live in one graph, not in isolated schemas or documents.
2. **Self-explaining** — concepts, relations, properties, and patterns carry their own descriptions as graph nodes, inspectable in place rather than documented separately.
3. **Semantic kernel, not universal ontology** — KG-Kernel defines the mechanisms for describing knowledge; it does not try to describe the whole world, and no application built on it needs to either.
4. **Domain-independent** — the kernel has no built-in bias toward Built Asset Management, Finance, Healthcare, or any other domain.
5. **Application-oriented** — the point is working applications and the knowledge graphs they need, not ontology engineering for its own sake.
6. **Reusable ontology network** — ontology modules reuse and depend on one another instead of each being modeled from scratch; a concept is defined once, at the right level of abstraction, and built on by everything downstream.
7. **Variable-depth semantic structure** — a simple application might use one ontology module above its instances; another might stack many interconnected ones. Nothing caps the depth or forces a tree.
8. **Explicit modeling of application-critical knowledge** — model precisely the semantics that need application-level agreement; delegate everything else to general knowledge. Where that boundary sits is a design decision the application owner makes, not something the kernel dictates.
9. **Ontology-governed instance layer** — instance data is created and maintained according to definitions the ontology network has already established, not invented ad hoc at data-entry time.
10. **Semantic grounding and governance for LLMs** — a durable, governed structure an LLM can be grounded in across interactions, applications, and datasets, rather than a prompt-scoped instruction that's rebuilt — and reinvented — every time.

## Why a kernel, not another schema

Knowledge graphs built by loosely extracting entities and relations — from documents, from an LLM, from ad-hoc scripts — tend to become **spaghetti graphs**: every source invents its own labels, the same real-world thing shows up under three different names, and nothing constrains what can connect to what. They're hard to query with confidence and impossible for a human to verify.

KG-Kernel's answer is to fix a small, stable set of constructs up front — the rules for what counts as a "thing," a "relation," or a "property" — so that everything built on top is governed and self-consistent by construction, instead of governed after the fact by cleanup. That matters more, not less, now that LLMs are often the ones doing the extracting:

> The question to address isn't "Can an LLM build a knowledge graph?" It's "Can a stable, reusable ontology network act as the semantic control plane that lets an LLM reliably build and maintain instance graphs?"

## KG-Kernel as a complex system

This is the same problem restated in complex-systems terms: a knowledge graph built without governance tends toward chaos, and that's not a failure of effort — it's the natural behavior of a complex system without shared rules.

KG-Kernel takes the opposite approach. It is a core system that defines how smaller systems (ontology modules) are created and how they connect into a larger one. Rather than imposing a master schema, it provides the minimal generative rules — the vocabulary of entities, relations, properties, lifecycles, processes, and states — by which diverse ontology modules can emerge and interoperate within a single graph.

This is what complex systems theory calls ordered emergence: the capacity for specialized knowledge domains to coexist, interact, and be traversed as a unified whole, without requiring a central authority to dictate their contents. Each ontology module is autonomous in what it describes, yet governed by the same foundational rules in how it describes it. The result is not a monolithic schema but a federation of ontology modules that share a common grammar.

## The three universal aspects

For any domain to be fully describable, three aspects must be present in the kernel itself — not left to individual ontology modules to invent independently:

### Lifecycle

Things do not exist in a vacuum of time. They come into being, pass through stages, and are superseded or retired. `Ontology_Lifecycle` and `Ontology_Lifecycle_Stage` capture this universal dimension, ensuring every domain can express when things happen and in what order, using a shared vocabulary.

### Process

Things are not static. They are created, transformed, inspected, approved, and consumed through activities. `Ontology_Process` and `Ontology_Process_Activity` capture this, providing a common language for how change occurs — whether in a zoo (an animal is born, matures, is transferred) or an assurance network (a requirement is drafted, reviewed, approved, implemented).

### State

At any given moment, a thing is in a particular condition or configuration. That condition determines what relations are valid, what properties are required, and what transitions are permitted. `Ontology_States` defines the set of conditions a kind of thing can be in, and `Ontology_Current_State` captures a specific thing's condition as a first-class concept — not merely a property value, but a constraint on what can be true of an entity right now.

These three aspects — lifecycle, process, and state — are intentionally part of the core rather than left to ontology modules. They are as universal as entity, relation, and property. Without them, every domain would reinvent its own conventions for time, change, and condition, and cross-domain traversal would break down precisely where it matters most: understanding what is true, what happened, and what is possible.

## The ontology network

KG-Kernel splits knowledge modeling into three concerns, kept in the *same* graph and distinguished by layer-specific labels plus explicit cross-layer relationships (like `ONTOLOGY_HAS_TYPE` and `INSTANCE_OF`):

| Concern | Answers | Cardinality |
|---|---|---|
| **The kernel** (this repo) | What is a "thing," a "relation," a "property," in general, for *any* domain? | Exactly one — shared by everything built on it |
| **Ontology modules** | What kinds of things, connections, and rules matter *for this application or domain*? | Any number, at any depth, reusing and depending on one another |
| **Instances** | What actually exists, or happened, in a particular application's data? | Whatever the application observes |

In the simplest case this looks like the familiar meta/domain/instance split: one ontology module sitting above the instances. But the kernel doesn't assume that shape — an application can chain several ontology modules together (a shared core, specialized by an industry module, specialized again by a company-specific one), and different applications can pick different depths. The fundamental structure is a **reuse network**, not a fixed stack: a concept gets defined once, at the right level of abstraction, and downstream ontology modules build on it rather than redefining it.

## Explicit where it matters

KG-Kernel is deliberately not trying to model everything. An application decides, on its own terms, which concepts need a precise, agreed, explicit definition in the graph — and lets an LLM's general knowledge fill in the rest. If ambiguity around a concept wouldn't materially affect the application, it doesn't need a node.

This also means an ontology network can start small. An application can launch with a minimal core — just the concepts it actually needs to agree on today — and add ontology modules later only when a real business need shows up, rather than front-loading a complete domain model before anything ships.

## One core, many domains

Because an ontology module is *an* ontology, not *the* ontology, a single graph built on KG-Kernel can hold several of them side by side — and, since it's a network rather than a hierarchy, several ontology modules can each depend on the same shared sub-module instead of each reinventing it. They don't need to be merged into one master schema to coexist; they just need to share the kernel's rules for what an entity, relation, and property are. That shared foundation is what makes it possible to traverse *across* domains with the same query patterns you'd use *within* one.

A professional example: a construction project isn't one domain, it's several overlaid on the same physical things. A single wall might be described by an **aesthetics** ontology module (finish, color), a **materials** module (concrete grade, supplier), a **safety** module (fire rating, hazard controls), and an **assurance** module (which requirement it satisfies, what evidence certifies it) — each possibly reusing a common "Physical Asset" module underneath rather than modeling the wall from scratch. All four point at the same entity in the graph. A traversal like "show me everything connected to this wall" then naturally surfaces its finish, material spec, fire rating, and certification in one pass, because every module was built on the same kernel vocabulary instead of four incompatible schemas bolted together after the fact.

## A simple example

Imagine you're building a guide to a zoo.

- **The kernel** is the rulebook that says: *"A guide is made of things, the places they exist, and the connections between them — like which thing lives where."* It doesn't mention lions or cages at all. It would work equally well for a guide to a school, a kitchen, or a football team.
- **An ontology module** is what you get when you apply that rulebook to zoos specifically: you decide the animal-kingdom module needs a class called `Animal`, a class called `Habitat`, and a relation called `LIVES_IN` connecting them.
- **Instances** are the actual entries in your finished guide: `Leo` (an instance of `Animal`) `LIVES_IN` `Savannah Exhibit` (an instance of `Habitat`).

Nothing stops a separate `Farm` ontology module, built independently by someone else, from reusing the same `Animal` and `Habitat` concepts instead of redefining them — that reuse is what turns one ontology into a network of ontologies. And notice each concern only needs the one below it to make sense: you can't have "Leo lives in the Savannah Exhibit" without first deciding that "animals" and "living in a place" are things worth describing — and you can't decide that without first agreeing, in general, that a guide is made of things and connections between things. That general agreement is exactly what the kernel fixes once, for every ontology module built on it.

## Grounding LLMs in a stable semantic model

Left alone, an LLM asked to extract or generate knowledge has to invent a schema and a set of meanings on the fly — and it will invent them slightly differently each time, which is exactly how spaghetti graphs happen at scale. KG-Kernel is designed to be interpreted by an LLM as a persistent semantic context instead:

- **Retrieval-oriented** — ontology semantics point retrieval toward the concepts, relations, and properties actually relevant to the application, rather than a generic similarity search.
- **Ambiguity reduction** — where a domain-specific meaning has been made explicit in an ontology module, the LLM doesn't have to guess at it from general-purpose training data.
- **Ontology-governed instance construction** — instance data is created and maintained according to definitions the ontology network has already established, so an LLM extracting instances is filling in a known shape rather than drafting one.
- **Validation and governance** — the same ontology network gives you a basis for checking whether constructed instance knowledge actually conforms to the application's intended semantics.
- **Persistent semantic context** — unlike instructions embedded in a single prompt, the ontology network is a durable asset, reusable across LLM interactions, applications, and datasets rather than rebuilt each time.

## What's in the kernel

[kg-kernel.cypher](kg-kernel.cypher) currently defines 13 meta-classes and 4 meta-relations, all rooted under a single `Ontology` node (every ontology has exactly one):

| Meta-class | Answers |
|---|---|
| `Ontology_Domain` | Which discipline or subject matter does this ontology belong to? |
| `Ontology_Concept` | What does something mean, in the context of this ontology? |
| `Ontology_Lifecycle` / `Ontology_Lifecycle_Stage` | In what time-related stages do events occur? |
| `Ontology_Process` / `Ontology_Process_Activity` | How are things created, and how do they interact with their environment? |
| `Ontology_States` / `Ontology_Current_State` | What states can things be in, and what state are they in right now? |
| `Ontology_Entity` | What exists? |
| `Ontology_Relation` | How may things connect? |
| `Ontology_Property` | What attributes may be recorded? |
| `Ontology_Pattern` | What reusable graph structures exist, and what do they mean? |

One deliberate design choice worth calling out: relations are modeled as `Ontology_Relation` **nodes**, not just Cypher relationship types — even the meta-relations (`ONTOLOGY_HAS_PART`, `ONTOLOGY_HAS_TYPE`, `ONTOLOGY_HAS_PROPERTY`, `IS_SUPERSEDED_BY`) are defined this way. That's what lets a relation carry its own documentation and lifecycle (`created_on` / `superseded_on`) exactly like an entity can — keeping every ontology element, not just entities, inspectable and self-explaining.

## Status

Just starting. The kernel currently defines the meta-class vocabulary; ontology-network patterns (module reuse, dependency, mapping/alignment across modules) and the LLM-grounding workflow described above are the current direction, not yet implemented.

KG-Kernel explores whether a persistent, self-explaining ontology network can turn probabilistic LLM-assisted knowledge extraction into human-verifiable application knowledge, from which deterministic decisions can be derived.

## Related writing

More background and worked examples on this approach are on the author's blog at [nedev.digital](https://nedev.digital), including the [Assurance Knowledge Platform Ontology Architecture Specification](https://nedev.digital/blog/posts/ontology-architecture), which applies an ontology-network pattern to a real domain.
