// =============================================
//  META-ONTOLOGY KERNEL (DOMAIN-AGNOSTIC)
// =============================================

// =============================================
// 1. CREATING NODES FOR CLASSES AND INSTANCES
// =============================================

// Note: GUIDs generated using https://www.uuidgenerator.net/guid

MERGE (ontology:Ontology {
    GUID: "72074c16-785d-46d1-a9be-8d1936470121",
    label: "Ontology",
    text: "Represents the root Ontology node. Question answered: What, in general, is this ontology about? For this instance: KG-Kernel is a semantic kernel for defining reusable, application-specific ontologies to allow application data to be described, connected, and interpreted within a common semantic framework. KG-Kernel has two distinct parts: 1. Semantic Layer - a network of semantic nodes to describe the data structure and its meaning; and 2. Data Layer - the application data. Semantic Layer labels defined by the kernel carry a Semantic_ prefix (e.g. Semantic_Entity, Semantic_Relation), so they are visually distinguishable from Data Layer labels, which carry no such prefix. The bare Ontology label is the one exception: it names the concept of being an ontology itself, not just Semantic Layer membership."
})

MERGE (domain:Semantic_Domain {
    GUID: "bac51954-923d-4e43-a9af-f896f5dcdf06",
    label: "Semantic_Domain",
    text: "Specifies a domain or domains represented within an ontology. An ontology can represent one or multiple domains. Semantic_Domain nodes can be pointed from Semantic_Entity nodes to represent an entity's belonging to a domain. Question answered: Which discipline, subject matter, or area of application does this relate to? For this instance: The domain is application-specific Knowledge Graphs."
})

MERGE (concept:Semantic_Concept {
    GUID: "7247cb5c-8b19-491b-a66c-62f086d67bd9",
    label: "Semantic_Concept",
    text: "Represents abstract meaning. An ontology can include one or multiple concepts. Semantic_Concept nodes can be pointed from Semantic_Entity nodes to represent the relation of an entity to a concept. Question answered: What does this mean? For this instance: Ontology is part of philosophy concerned with describing things and the relations between them; Knowledge is the combination of instance data and information that explains it; Graph is a data model that contains nodes and relations."
})

MERGE (lifecycle:Semantic_Lifecycle {
    GUID: "f2bf93a7-6b15-4c13-8e6f-449a40b9e61a",
    label: "Semantic_Lifecycle",
    text: "Represents a group of lifecycle stages. An ontology can include one or multiple lifecycles. Semantic_Lifecycle nodes can be pointed to Semantic_Lifecycle_Stage nodes to group them into a meaningful, time-related sequence. Question answered: Through what time-related stages does something progress?"
})

MERGE (lifecycle_stage:Semantic_Lifecycle_Stage {
    GUID: "003b4b5a-1987-4a93-9fa9-5b35280dd362",
    label: "Semantic_Lifecycle_Stage",
    text: "Represents a phase within a lifecycle. A lifecycle can include one or multiple lifecycle stages. Semantic_Lifecycle_Stage nodes can be pointed to Semantic_Entity nodes to represent the lifecycle stage an entity is in. Question answered: What stage is something in? For the KG-Kernel ontology, lifecycle stages are Active and Superseded. Active is the default stage and is assumed for all nodes unless a node is explicitly linked to the Superseded lifecycle stage."
})

    // Lifecycle Stages

    MERGE (active:Semantic_Lifecycle_Stage {
        GUID: "e5b2843b-c7a8-4de0-a7d7-e9c4d3cdae44",
        name: "active",
        text: "Represents the default Active phase of a node. It's recommended not to explicitly relate to this node as it's implicitly applied for all nodes within the graph, unless explicitly releted to Superseded instance. Question answered: Is a node active?"
    })

    MERGE (superseded:Semantic_Lifecycle_Stage {
        GUID: "857962e4-0121-4013-ad91-985472efce8b",
        name: "superseded",
        text: "Represents the Superseded phase of a node. Question answered: Is a node superseded?"
    })

MERGE (process:Semantic_Process {
    GUID: "80d783c1-7e68-4161-82ae-2ccad00ae4d6",
    label: "Semantic_Process",
    text: "Represents a group of activities connected by meaningful input-output dependencies. An ontology can include one or multiple processes. Semantic_Process nodes can be pointed to Semantic_Process_Activity nodes to group them into a meaningful process. Question answered: How do things change? For this instance: no processes are applied."
})

MERGE (process_activity:Semantic_Process_Activity {
    GUID: "f19deffb-c783-4f90-9be7-cc2b505ebc53",
    label: "Semantic_Process_Activity",
    text: "Represents an activity within a process. A process can include one or multiple activities. Semantic_Process_Activity nodes can be pointed to Semantic_Entity nodes to represent entities as inputs to or outputs from an activity. Question answered: What activity does something participate in? For this instance: no processes are applied."
})

MERGE (state_set:Semantic_State_Set {
    GUID: "ca183be2-916f-46d6-bd46-b7407dc78108",
    label: "Semantic_States_Set",
    text: "Describes a set of states that a thing can be in. Question answered: What states can something be in? For this instance: no states are applied."
})

MERGE (state:Semantic_State {
    GUID: "024f8af6-8432-43da-91eb-e5d5d2cc9b11",
    label: "Semantic_State",
    text: "Represents a specific state a thing can be in. Question answered: What state is something in? For this instance: no states are applied."
})

MERGE (entity:Semantic_Entity {
    GUID: "b3340f05-d215-44a6-b6c0-ed98ee916dcd",
    label: "Semantic_Entity",
    text: "Represents things that exist and are relevant to the ontology. These are the main building blocks of knowledge. Question answered: What exists? For this instance: no entities are identified."
})

MERGE (relation:Semantic_Relation {
    GUID: "f81715f1-157e-4640-b14d-cc5ae2a9c03b",
    label: "Semantic_Relation",
    text: "Represents a permitted, meaningful relation between two things. Every Semantic_Relation definition must be linked to exactly two Semantic_Entity nodes and describe how they relate. Question answered: How may things connect?"
})

    // Relation instances

    MERGE (rel_has_part:Semantic_Relation {
        GUID: "e3fa8660-c5d1-488f-898e-7e81e9695ff9",
        label: "SEMANTIC_HAS_PART",
        text: "Used to define mereology within the Semantic Layer only. A node reached via a chain of SEMANTIC_HAS_PART edges from an already-instantiated node inherits that instance status; instantiation does not need to be re-asserted at every part."
    })

    MERGE (rel_has_type:Semantic_Relation {
        GUID: "b79d5579-270b-4a0d-bd03-54007dc3eab7",
        label: "SEMANTIC_HAS_TYPE",
        text: "Used to define taxonomy within the Semantic Layer only."
    })

    MERGE (rel_has_instance:Semantic_Relation {
        GUID: "f78667a1-79ff-4b7b-887f-182230dd6b4e",
        label: "SEMANTIC_HAS_INSTANCE",
        text: "Used to instantiate a concrete value of a type within the Semantic Layer only. A part reached via SEMANTIC_HAS_PART from an already-instantiated node does not need its own SEMANTIC_HAS_INSTANCE edge; its instance status is implied."
    })

    MERGE (rel_has_property:Semantic_Relation {
        GUID: "9dc4565e-d78f-47d2-a062-db95981ff968",
        label: "HAS_PROPERTY",
        text: "Used to define what properties can be assigned to a specific node type. The Common Generic Property Set is default for all nodes and therefore does not require explicit referncing."
    })

    MERGE (rel_is_superseded_by:Semantic_Relation {
        GUID: "7cc33eb6-dfe3-417e-b7a6-ca01162585d5",
        label: "IS_SUPERSEDED_BY",
        text: "Used to indicate that a node is superseded. Carries a date property (see HAS_PROPERTY) recording when the supersession occurred."
    })

    MERGE (rel_entity_has_instance:Semantic_Relation {
        GUID: "49923a99-6e75-4a32-8b55-e3b1709b8372",
        label: "ENTITY_HAS_INSTANCE",
        text: "Used to instantiate nodes from the Semantic Layer into the Data Layer, i.e. from a Semantic Layer Semantic_Entity node to a Data Layer node. This is the only relation allowed to cross from the Semantic Layer into the Data Layer."
    })

    MERGE (rel_relation_start:Semantic_Relation {
        GUID: "0d126544-f4c8-4d1c-a285-1f122998e582",
        label: "SEMANTIC_RELATION_START",
        text: "Formalizes the first of the two Semantic_Entity nodes a Semantic_Relation must be linked to (see Semantic_Relation). Points from the Semantic_Relation instance to the Semantic_Entity it starts from."
    })

    MERGE (rel_relation_end:Semantic_Relation {
        GUID: "7a28f467-894a-47f8-a308-50aed72e57fb",
        label: "SEMANTIC_RELATION_END",
        text: "Formalizes the second of the two Semantic_Entity nodes a Semantic_Relation must be linked to (see Semantic_Relation). Points from the Semantic_Relation instance to the Semantic_Entity it ends at."
    })

MERGE (pattern:Semantic_Pattern {
    GUID: "5ea28419-4ebe-4076-9d8e-873824e1b98b",
    label: "Semantic_Pattern",
    text: "Represents reusable graph structures in Cypher notation. Question answered: What reusable structures exist and what do they mean?"
})

    // Pattern instances

    MERGE (pattern_basic_entity_instantiation:Semantic_Pattern {
        GUID: "126a82e1-7720-4464-aaf1-441033f341b9",
        name: "basicEntityInstantiation",
        text: "Minimal path from an ontology module to a Data Layer instance: an ontology module specializes the kernel's Ontology concept, defines an entity as one of its parts, and that entity is instantiated into the Data Layer. This basic form omits taxonomy and mereology beyond the kernel's own structure, which a real ontology module would typically add. Illustrative example (zoo ontology module): (:Ontology)-[:SEMANTIC_HAS_TYPE]->(zoo_guide:Ontology)-[:SEMANTIC_HAS_PART]->(lion:Semantic_Entity)-[:ENTITY_HAS_INSTANCE]->(simba:Lion)"
    })

    MERGE (pattern_entity_relation:Semantic_Pattern {
        GUID: "c3cfc836-c5c2-46e1-b893-f5b1ed51232a",
        name: "entityRelation",
        text: "Shows a module-defined Semantic_Relation connecting Data Layer instances of two of the module's own entities. Semantic_Relation requires being linked to exactly two Semantic_Entity nodes, formalized via SEMANTIC_RELATION_START and SEMANTIC_RELATION_END. Illustrative example (zoo ontology module: Animal and Habitat as Semantic_Entity nodes, LIVES_IN as the Semantic_Relation connecting them): (lives_in:Semantic_Relation)-[:SEMANTIC_RELATION_START]->(animal:Semantic_Entity), (lives_in)-[:SEMANTIC_RELATION_END]->(habitat:Semantic_Entity); at the Data Layer: (simba:Lion)-[:LIVES_IN]->(savannah:Habitat)"
    })

    MERGE (pattern_taxonomy_mereology:Semantic_Pattern {
        GUID: "722ae47f-2f82-4b7a-9c28-5ebcc9e72c21",
        name: "taxonomyAndMereology",
        text: "Shows the two relations basicEntityInstantiation deliberately omits: taxonomy, where a general entity has a more specific one as a type, and mereology, where a whole entity has another entity as a part. Both keep the kernel's general-to-specific direction: the general or whole node is always the source. Illustrative example (zoo ontology module): (animal:Semantic_Entity)-[:SEMANTIC_HAS_TYPE]->(lion:Semantic_Entity); (bird:Semantic_Entity)-[:SEMANTIC_HAS_PART]->(wing:Semantic_Entity)"
    })

MERGE (property_set:Semantic_Property_Set {
    GUID: "7e5a19f5-52d1-405a-ab7d-5fae6cd66e7e",
    label: "Semantic_Property_Set",
    text: "Represents a set of properties. A Semantic_Entity can point to multiple Semantic_Property and Semantic_Property_Set nodes, so a Semantic_Property_Set is a convenient grouping element. Question answered: What attributes may be recorded?"
})

MERGE (property:Semantic_Property {
    GUID: "1ccd9da0-454c-4acd-8320-39c72b9374b9",
    label: "Semantic_Property",
    text: "Represents a reusable definition of a property. A Semantic_Entity can point to multiple Semantic_Property and Semantic_Property_Set nodes. Question answered: What attributes may be recorded?"
})

    // Properties

    MERGE (prop_set_common:Semantic_Property_Set {
        GUID: "b022e8f6-518d-4382-aa12-0f15cfe0db3f",
        name: "commonGeneric",
        text: "The Common and Generic Property Set is required for all graph nodes."
    })

    MERGE (prop_GUID:Semantic_Property {
        GUID: "461bc96d-244a-4586-98ed-ca6c87368994",
        name: "GUID",
        text: "Globaly unique identificator recommended for all graph nodes. It can be any text format."
    })

    MERGE (prop_label:Semantic_Property {
        GUID: "64a48bd1-1227-40d9-89cd-6c1e99071172",
        name: "label",
        text: "A label that can be used in the Graph nodes and relations. The format must be each word capitalized, joined by underscores For_Example_Like_This."
    })

    MERGE (prop_name:Semantic_Property {
        GUID: "8da58979-ebdb-4ad1-abe1-232ba4dcce57",
        name: "name",
        text: "A short text in camelCase format."
    })

    MERGE (prop_text:Semantic_Property {
        GUID: "d7d64ec4-8e64-4f69-b072-05249634f79b",
        name: "text",
        text: "Generic data container, required for every node in the graph, in text format. If applicable, it can store encoded structured data in JSON format."
    })

    // Not part of the Common Generic Property Set - assigned only where needed, via HAS_PROPERTY

    MERGE (prop_date:Semantic_Property {
        GUID: "7109a36f-a196-4158-8f6d-6329ac4be2cb",
        name: "date",
        text: "Records when something occurred, in ISO 8601 format (YYYY-MM-DD). Not part of the Common Generic Property Set; currently assigned only to the IS_SUPERSEDED_BY relation, via HAS_PROPERTY, to timestamp when a node was superseded."
    })

// =============================================
// 2. CREATING RELATIONS
// =============================================

MERGE (ontology)-[:SEMANTIC_HAS_PART]->(domain)
MERGE (ontology)-[:SEMANTIC_HAS_PART]->(concept)
MERGE (ontology)-[:SEMANTIC_HAS_PART]->(lifecycle)
MERGE (lifecycle)-[:SEMANTIC_HAS_PART]->(lifecycle_stage)
MERGE (lifecycle_stage)-[:SEMANTIC_HAS_INSTANCE]->(active)
MERGE (lifecycle_stage)-[:SEMANTIC_HAS_INSTANCE]->(superseded)
MERGE (ontology)-[:SEMANTIC_HAS_PART]->(process)
MERGE (process)-[:SEMANTIC_HAS_PART]->(process_activity)
MERGE (ontology)-[:SEMANTIC_HAS_PART]->(state_set)
MERGE (state_set)-[:SEMANTIC_HAS_PART]->(state)
MERGE (ontology)-[:SEMANTIC_HAS_PART]->(entity)
MERGE (ontology)-[:SEMANTIC_HAS_PART]->(relation)
MERGE (relation)-[:SEMANTIC_HAS_INSTANCE]->(rel_has_part)
MERGE (relation)-[:SEMANTIC_HAS_INSTANCE]->(rel_has_type)
MERGE (relation)-[:SEMANTIC_HAS_INSTANCE]->(rel_has_instance)
MERGE (relation)-[:SEMANTIC_HAS_INSTANCE]->(rel_has_property)
MERGE (relation)-[:SEMANTIC_HAS_INSTANCE]->(rel_entity_has_instance)
MERGE (relation)-[:SEMANTIC_HAS_INSTANCE]->(rel_is_superseded_by)
MERGE (relation)-[:SEMANTIC_HAS_INSTANCE]->(rel_relation_start)
MERGE (relation)-[:SEMANTIC_HAS_INSTANCE]->(rel_relation_end)
MERGE (ontology)-[:SEMANTIC_HAS_PART]->(pattern)
MERGE (pattern)-[:SEMANTIC_HAS_INSTANCE]->(pattern_basic_entity_instantiation)
MERGE (pattern)-[:SEMANTIC_HAS_INSTANCE]->(pattern_entity_relation)
MERGE (pattern)-[:SEMANTIC_HAS_INSTANCE]->(pattern_taxonomy_mereology)
MERGE (ontology)-[:SEMANTIC_HAS_PART]->(property_set)
MERGE (property_set)-[:SEMANTIC_HAS_PART]->(property)
MERGE (property_set)-[:SEMANTIC_HAS_INSTANCE]->(prop_set_common)
MERGE (prop_set_common)-[:SEMANTIC_HAS_PART]->(prop_GUID)
MERGE (prop_set_common)-[:SEMANTIC_HAS_PART]->(prop_label)
MERGE (prop_set_common)-[:SEMANTIC_HAS_PART]->(prop_name)
MERGE (prop_set_common)-[:SEMANTIC_HAS_PART]->(prop_text)
MERGE (property)-[:SEMANTIC_HAS_INSTANCE]->(prop_date)
MERGE (rel_is_superseded_by)-[:HAS_PROPERTY]->(prop_date)
