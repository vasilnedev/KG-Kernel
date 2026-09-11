// =============================================
//  META-ONTOLOGY KERNEL (DOMAIN-AGNOSTIC)
// =============================================

// =============================================
// 1. META-CLASSES 
// =============================================

// Meta Nodes

MERGE (ontology:Ontology {
    label: "Ontology",
    text: "Every ontology must have one and only one Ontology node - root node.",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (domain:Ontology_Domain {
    label: "Ontology_Dimain",
    text: "Specifies a domain or domains represented within an ontology. An ontology can represent one or multiple domains. Ontology_Domain nodes can be pointed to Ontology_Entity nodes to represent belonging of an entity to a domain. Question answered: Which discipline or subject matter this belong to?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (concept:Ontology_Concept {
    label: "Ontology_Concept",
    text: "Represents abstract meaning. An ontology can include one or multiple concepts. Ontology_Concept nodes can be pointed to Ontology_Entity nodes to represent reletion of an entity to a concept. Question answered: What does this mean?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (lifecycle:Ontology_Lifecycle {
    label: "Ontology_Lifecycle",
    text: "Represents a lifecycle group of stages. An ontology can include one or multiple lifecycles. Ontology_Lifecycle nodes can be pointed to Ontology_Lifecycle_Stage nodes to group them for a meaningful, time related sequence. Question answered: In what time related stages events occure?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (lifecycle_stage:Ontology_Lifecycle_Stage {
    label: "Ontology_Lifecycle_Stage",
    text: "Represents a phase or state within a lifecycle. A lifecycle can include one or multiple lifecycle stages. Ontology_Lifecycle_Stage nodes can be pointed to Ontology_Entity nodes to represent a moment when an entity belongs to. Question answered: What does somethin occure?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (process:Ontology_Process {
    label: "Ontology_Process",
    text: "Represents a group of sequential activities. An ontology can include one or multiple processes. Ontology_Process nodes can be pointed to Ontology_Process_Activity nodes to group them for a meaningful, input-output dependency. Question answered: How things are created?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (process_activity:Ontology_Process_Activity {
    label: "Ontology_Process_Activity",
    text: "Represents an activity within a process. A process can include one or multiple activities. Ontology_Process_Activity nodes can be pointed to Ontology_Entity nodes to represent how an entity is created. Question answered: What activity something belongs to?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (states:Ontology_States {
    label: "Ontology_States",
    text: "Desctibes a set of states that a thing can be in. Question answered: What state somthing can be in to?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (current_state:Ontology_Current_State {
    label: "Ontology_Current_State",
    text: "Represents a current state a thing is currently in. Question answered: What is the current state of something?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (entity:Ontology_Entity {
    label: "Ontology_Entity",
    text: "Represents things that exist. Thi are the main building blocks of knowledge. Question answered: What exists?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (relation:Ontology_Relation {
    label: "Ontology_Relation",
    text: "Represents permitted, meaningful reletaion between two things. Every Ontology_Relation definition must be linked to exactly two Ontology_Entity nodes and describe a relation. Question answered: How may things connect?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (property:Ontology_Property {
    label: "Ontology_Property",
    text: "Represents reusable property class definition. An Ontology_Entity can point to multiple Ontology_Property nodes. And very Ontology_Property node can be pointed by multiple Ontology_Entity nodes to allow sharing common property definitions. Question Answered: What attributes may be recorded?",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (pattern:Ontology_Pattern {
    label: "Ontology_Pattern",
    text: "Represents reusable graph structures in Cypher notation. Question Answered: What reusable structures exist and what they mean?",
    created_on: "2026-08-26",
    superseded_on: null
});

// Meta Relations

MERGE (rel_has_part:Ontology_Relation {
    label: "ONTOLOGY_HAS_PART",
    text: "",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (rel_has_type:Ontology_Relation {
    label: "ONTOLOGY_HAS_TYPE",
    text: "",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (rel_has_property:Ontology_Relation {
    label: "ONTOLOGY_HAS_PROPERTY",
    text: "",
    created_on: "2026-08-26",
    superseded_on: null
});

MERGE (rel_is_superseded_by:Ontology_Relation {
    label: "IS_SUPERSEDED_BY",
    text: "",
    created_on: "2026-08-26",
    superseded_on: null
});