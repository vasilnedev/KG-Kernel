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
    text: "Represents the root Ontology node. Question answered: What, in general, is this ontology about? For this instance: KG-Kernel is a semantic kernel for defining reusable, application-specific ontologies to allow application data to be described, connected, and interpreted within a common semantic framework. KG-Kernel has two distinct parts: 1. Semantic Layer - a network of semantic nodes to describe the data structure and its meaning; and 2. Data Layer - the application data. Semantic Layer labels defined by the kernel carry an Ontology / Ontology_ prefix (e.g. Ontology_Entity, Ontology_Relation) so they are visually distinguishable from Data Layer labels, which carry no such prefix."
});

MERGE (domain:Ontology_Domain {
    GUID: "bac51954-923d-4e43-a9af-f896f5dcdf06",
    label: "Ontology_Domain",
    text: "Specifies a domain or domains represented within an ontology. An ontology can represent one or multiple domains. Ontology_Domain nodes can be pointed from Ontology_Entity nodes to represent an entity's belonging to a domain. Question answered: Which discipline, subject matter, or area of application does this relate to? For this instance: The domain is application-specific Knowledge Graphs."
});

MERGE (concept:Ontology_Concept {
    GUID: "7247cb5c-8b19-491b-a66c-62f086d67bd9",
    label: "Ontology_Concept",
    text: "Represents abstract meaning. An ontology can include one or multiple concepts. Ontology_Concept nodes can be pointed from Ontology_Entity nodes to represent the relation of an entity to a concept. Question answered: What does this mean? For this instance: Ontology is part of philosophy concerned with describing things and the relations between them; Knowledge is the combination of instance data and information that explains it; Graph is a data model that contains nodes and relations."
});

MERGE (lifecycle:Ontology_Lifecycle {
    GUID: "f2bf93a7-6b15-4c13-8e6f-449a40b9e61a",
    label: "Ontology_Lifecycle",
    text: "Represents a group of lifecycle stages. An ontology can include one or multiple lifecycles. Ontology_Lifecycle nodes can be pointed to Ontology_Lifecycle_Stage nodes to group them into a meaningful, time-related sequence. Question answered: Through what time-related stages does something progress?"
});

MERGE (lifecycle_stage:Ontology_Lifecycle_Stage {
    GUID: "003b4b5a-1987-4a93-9fa9-5b35280dd362",
    label: "Ontology_Lifecycle_Stage",
    text: "Represents a phase within a lifecycle. A lifecycle can include one or multiple lifecycle stages. Ontology_Lifecycle_Stage nodes can be pointed to Ontology_Entity nodes to represent the lifecycle stage an entity is in. Question answered: What stage is something in? For the KG-Kernel ontology, lifecycle stages are Active and Superseded. Active is the default stage and is assumed for all nodes unless a node is explicitly linked to the Superseded lifecycle stage."
});

    // Lifecycle Stages

    MERGE (active:Ontology_Lifecycle_Stage {
        GUID: "e5b2843b-c7a8-4de0-a7d7-e9c4d3cdae44",
        name: "active",
        text: "Represents the default Active phase of a node. It's recommended not to explicitly relate to this node as it's implicitly applied for all nodes within the graph, unless explicitly releted to Superseded instance. Question answered: Is a node active?"
    });

    MERGE (superseded:Ontology_Lifecycle_Stage {
        GUID: "857962e4-0121-4013-ad91-985472efce8b",
        name: "superseded",
        text: "Represents the Superseded phase of a node. Question answered: Is a node superseded?"
    });

MERGE (process:Ontology_Process {
    GUID: "80d783c1-7e68-4161-82ae-2ccad00ae4d6",
    label: "Ontology_Process",
    text: "Represents a group of activities connected by meaningful input-output dependencies. An ontology can include one or multiple processes. Ontology_Process nodes can be pointed to Ontology_Process_Activity nodes to group them into a meaningful process. Question answered: How do things change? For this instance: no processes are applied."
});

MERGE (process_activity:Ontology_Process_Activity {
    GUID: "f19deffb-c783-4f90-9be7-cc2b505ebc53",
    label: "Ontology_Process_Activity",
    text: "Represents an activity within a process. A process can include one or multiple activities. Ontology_Process_Activity nodes can be pointed to Ontology_Entity nodes to represent entities as inputs to or outputs from an activity. Question answered: What activity does something participate in? For this instance: no processes are applied."
});

MERGE (state_set:Ontology_State_Set {
    GUID: "ca183be2-916f-46d6-bd46-b7407dc78108",
    label: "Ontology_States_Set",
    text: "Describes a set of states that a thing can be in. Question answered: What states can something be in? For this instance: no states are applied."
});

MERGE (state:Ontology_State {
    GUID: "024f8af6-8432-43da-91eb-e5d5d2cc9b11",
    label: "Ontology_State",
    text: "Represents a specific state a thing can be in. Question answered: What state is something in? For this instance: no states are applied."
});

MERGE (entity:Ontology_Entity {
    GUID: "b3340f05-d215-44a6-b6c0-ed98ee916dcd",
    label: "Ontology_Entity",
    text: "Represents things that exist and are relevant to the ontology. These are the main building blocks of knowledge. Question answered: What exists? For this instance: no entities are identified."
});

MERGE (relation:Ontology_Relation {
    GUID: "f81715f1-157e-4640-b14d-cc5ae2a9c03b",
    label: "Ontology_Relation",
    text: "Represents a permitted, meaningful relation between two things. Every Ontology_Relation definition must be linked to exactly two Ontology_Entity nodes and describe how they relate. Question answered: How may things connect?"
});

    // Relation instances

    MERGE (rel_has_part:Ontology_Relation {
        GUID: "e3fa8660-c5d1-488f-898e-7e81e9695ff9",
        label: "ONTOLOGY_HAS_PART",
        text: "Used to define mereology within the Semantic Layer only."
    });

    MERGE (rel_has_type:Ontology_Relation {
        GUID: "b79d5579-270b-4a0d-bd03-54007dc3eab7",
        label: "ONTOLOGY_HAS_TYPE",
        text: "Used to define taxonomy within the Semantic Layer only."
    });

    MERGE (rel_has_instance:Ontology_Relation {
        GUID: "f78667a1-79ff-4b7b-887f-182230dd6b4e",
        label: "ONTOLOGY_HAS_INSTANCE",
        text: "Used to instenciate a type within the Semantic Layer only."
    });

    MERGE (rel_has_property:Ontology_Relation {
        GUID: "9dc4565e-d78f-47d2-a062-db95981ff968",
        label: "HAS_PROPERTY",
        text: "Used to define what properties can be assigned to a specific node type. The Common Generic Property Set is default for all nodes and therefore does not require explicit referncing."
    });

    MERGE (rel_is_superseded_by:Ontology_Relation {
        GUID: "7cc33eb6-dfe3-417e-b7a6-ca01162585d5",
        label: "IS_SUPERSEDED_BY",
        text: "Used to indicate that a node is superseded."
    });

    MERGE (rel_is_instance_of:Ontology_Relation {
        GUID: "49923a99-6e75-4a32-8b55-e3b1709b8372",
        label: "IS_INSTANCE_OF",
        text: "Used to instenciate nodes from the Semantic Layer into the Data Layer. This label must be used solely to point from a Data Layer node to a Semantic Layer node."
    });

MERGE (pattern:Ontology_Pattern {
    GUID: "5ea28419-4ebe-4076-9d8e-873824e1b98b",
    label: "Ontology_Pattern",
    text: "Represents reusable graph structures in Cypher notation. Question answered: What reusable structures exist and what do they mean?"
});

MERGE (property_set:Ontology_Property_Set {
    GUID: "7e5a19f5-52d1-405a-ab7d-5fae6cd66e7e",
    label: "Ontology_Property_Set",
    text: "Represents a set of properties. An Ontology_Entity can point to multiple Ontology_Property and Ontology_Property_Set nodes, so an Ontology_Property_Set is a convenient grouping element. Question answered: What attributes may be recorded?"
});

MERGE (property:Ontology_Property {
    GUID: "1ccd9da0-454c-4acd-8320-39c72b9374b9",
    label: "Ontology_Property",
    text: "Represents a reusable definition of a property. An Ontology_Entity can point to multiple Ontology_Property and Ontology_Property_Set nodes. Question answered: What attributes may be recorded?"
});

    // Properties

    MERGE (prop_set_common:Ontology_Property_Set {
        GUID: "b022e8f6-518d-4382-aa12-0f15cfe0db3f",
        name: "commonGeneric",
        text: "The Common and Generic Property Set is required for all graph nodes."
    });

    MERGE (prop_GUID:Ontology_Property {
        GUID: "461bc96d-244a-4586-98ed-ca6c87368994",
        name: "GUID",
        text: "Globaly unique identificator recommended for all graph nodes. It can be any text format."
    });

    MERGE (prop_label:Ontology_Property {
        GUID: "64a48bd1-1227-40d9-89cd-6c1e99071172",
        name: "label",
        text: "A label that can be used in the Graph nodes and relations. The format must be each word capitalized, joined by underscores For_Example_Like_This."
    });

    MERGE (prop_name:Ontology_Property {
        GUID: "8da58979-ebdb-4ad1-abe1-232ba4dcce57",
        name: "name",
        text: "A short text in camelCase format."
    });

    MERGE (prop_text:Ontology_Property {
        GUID: "d7d64ec4-8e64-4f69-b072-05249634f79b",
        name: "text",
        text: "Generic data container, required for every node in the graph, in text format. If applicable, it can store encoded structured data in JSON format."
    });

// =============================================
// 2. CREATING RELATIONS
// =============================================

MERGE (ontology)-[ONTOLOGY_HAS_PART]->(domain)
MERGE (ontology)-[ONTOLOGY_HAS_PART]->(concept)
MERGE (ontology)-[ONTOLOGY_HAS_PART]->(lifecycle)
MERGE (lifecycle)-[ONTOLOGY_HAS_PART]->(lifecycle_stage)
MERGE (lifecycle_stage)-[ONTOLOGY_HAS_INSTANCE]->(active)
MERGE (lifecycle_stage)-[ONTOLOGY_HAS_INSTANCE]->(superseded)
MERGE (ontology)-[ONTOLOGY_HAS_PART]->(process)
MERGE (process)-[ONTOLOGY_HAS_PART]->(process_activity)
MERGE (ontology)-[ONTOLOGY_HAS_PART]->(state_set)
MERGE (state_set)-[ONTOLOGY_HAS_PART]->(state)
MERGE (ontology)-[ONTOLOGY_HAS_PART]->(entity)
MERGE (ontology)-[ONTOLOGY_HAS_PART]->(relation)
MERGE (relation)-[ONTOLOGY_HAS_INSTANCE]->(rel_has_part)
MERGE (relation)-[ONTOLOGY_HAS_INSTANCE]->(rel_has_type)
MERGE (relation)-[ONTOLOGY_HAS_INSTANCE]->(rel_has_instance)
MERGE (relation)-[ONTOLOGY_HAS_INSTANCE]->(rel_has_property)
MERGE (relation)-[ONTOLOGY_HAS_INSTANCE]->(rel_is_instance_of)
MERGE (relation)-[ONTOLOGY_HAS_INSTANCE]->(rel_is_superseded_by)
MERGE (ontology)-[ONTOLOGY_HAS_PART]->(pattern)
MERGE (ontology)-[ONTOLOGY_HAS_PART]->(property_set)
MERGE (property_set)-[ONTOLOGY_HAS_PART]->(property)
MERGE (property_set)-[ONTOLOGY_HAS_INSTANCE]->(prop_set_common)
MERGE (prop_set_common)-[ONTOLOGY_HAS_PART]->(prop_GUID)
MERGE (prop_set_common)-[ONTOLOGY_HAS_PART]->(prop_label)
MERGE (prop_set_common)-[ONTOLOGY_HAS_PART]->(prop_name)
MERGE (prop_set_common)-[ONTOLOGY_HAS_PART]->(prop_text)
