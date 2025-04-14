#import "@preview/physica:0.9.4": *
#import "@preview/cetz:0.2.2": canvas, draw, tree, plot
#import "@preview/unequivocal-ams:0.1.2": ams-article, theorem, proof

#show link: set text(blue)
#show raw.where(block:true): it=>{
  par(justify:false,block(fill:rgb("#f0fef0"),inset:1.5em,width:99%,text(it)))
}

#let xuanzhao(txt) = {
  text(purple, [[XZ: #txt]])
}

#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)


#show: ams-article.with(
  title: [Notes on Category Theory],
  authors: (
    (
      name: "Xuanzhao gao",
    ),
  ),
  // abstract: [This note is based on the book "Basic Category Theory" by Tom Leinster.],
  bibliography: bibliography("refs.bib"),
)

This note is based on the book "Basic Category Theory" by Tom Leinster @leinster2016basiccategorytheory.

= Chapter 0: Basic concepts

I noticed that the book frequently uses the following objects as examples: sets, groups, fields, rings and topological spaces.
Here a brief review of these objects is given.

== Sets

A set is a collection of different objects, which are called elements.
The mapping between sets is called a function.

#align(center, image("figs/function-mapping.svg", width: 100%))

== Groups

A group is a non-empty set $G$ equipped with a binary operation $dot$ that satisfies the following properties:
- Associativity: $(a dot b) dot c = a dot (b dot c)$
- Identity: $e dot a = a dot e = a$
- Inverses: $a dot a^{-1} = a^{-1} dot a = e$
The set is called the *underlying set* of the group, and the binary operation is called the *group operation*.

Group homomorphism are functions that respect group structure: a map $f: (G, dot) arrow (H, *)$ between two groups is a homomorphism if $f(a dot b) = f(a) * f(b)$ for all $a, b in G$.
An isomorphism is a homomorphism that has an inverse homomorphism; equivalently, it is a bijective homomorphism.

$G$-sets: a $G$-set is a set $S$ equipped with an action of a group $G$. 
$S$ is called a left $G$-set if there exists a map $phi: G times S arrow S$ that satisfies $phi(g, phi(h, s)) = phi(g dot h, s)$ and $phi(e, s) = s$ for all $g, h in G$ and $s in S$, then $phi$ is called a left action.
Similarly, a right $G$-set is defined by a map $phi: S times G arrow S$ that satisfies $phi(phi(s, g), h) = phi(s, g dot h)$ and $phi(s, e) = s$ for all $g, h in G$ and $s in S$, then $phi$ is called a right action.

A *quotient group* or factor group is a mathematical group obtained by aggregating similar elements of a larger group using an equivalence relation that preserves some of the group structure (the rest of the structure is "factored out"). For example, the cyclic group of addition modulo $n$ can be obtained from the group of integers under addition by identifying elements that differ by a multiple of $n$ and defining a group structure that operates on each such class (known as a congruence class) as a single entity.

== Fields

A field is a non-empty set $F$ equipped with two binary operations, addition and multiplication, that satisfies the following properties:
- Associativity: $(a + b) + c = a + (b + c)$
- Associativity: $(a dot b) dot c = a dot (b dot c)$
- Identity: $0 + a = a + 0 = a$
- Identity: $1 dot a = a dot 1 = a$
- Inverses: $a + (-a) = (-a) + a = 0$
- Inverses: for any $a eq.not 0$, $a dot a^{-1} = a^{-1} dot a = 1$
- Distributivity: $a dot (b + c) = (a dot b) + (a dot c)$
Here $0$ and $1$ are the additive and multiplicative identities, respectively.

An example: $bb(R)$ is a set, $(bb(R), +)$ is a group, and $(bb(R), +, dot)$ is a field.

== Rings

A ring is a set $R$ equipped with two binary operations, addition and multiplication, and satisfies the following properties:
- $R$ is an abelian group under addition, (addition is commutative)
- $R$ is a monoid under multiplication, where monoids are semigroups with identity
- Distributivity: $a dot (b + c) = (a dot b) + (a dot c)$

A simple example is the 2 by 2 matrices with integer entries.

== Topological spaces

A topological space is a set whose elements are called points, along with an additional structure called a topology, which can be defined as a set of neighbourhoods for each point that satisfy some axioms formalizing the concept of closeness.



= Chapter 1: Categories, functors and natural transformations

A category is a system of related objects, such as group or topological spaces, and are connected by relations such as homeomorphisms or continuous maps.

The maps between categories are called functors, and the maps between functors are called natural transformations.

== Categories

A category $scr(A)$ consists of:

- $"ob"(scr(A))$: objects
- $scr(A)(A, B)$: maps between the objects
- composition: $scr(A)(B, C) times scr(A)(A, B) arrow scr(A)(A, C)$
- identity: $scr(A)(A, A)$


In a discrete category, all objects are not connected to each other.

Group as a category: A group $G$ can be regarded as a category with a single object, each element of $G$ is considered as a map.

Preorder as a category: $A lt.eq B$ and $B lt.eq C$ implies $A lt.eq C$. Order: if $A lt.eq B$ and $B lt.eq A$ implies $A eq C$.

The *principle of duality* is fundamental to category theory. Informally, it states that every categorical definition, theorem and proof has a dual, obtained by reversing all the arrows.

== Functors

Functors describe how categories are related to each other.
Two parts: mapping objects and mapping morphisms.
#align(left, image("figs/functors.png", width: 80%))

Forgetful functors: when mapping categories, it forgets some structure or properties.

Free functors: a dual of forgetful functors, it adds structure to the objects.

Contravariant functor: Let $scr(A)$ and $scr(B)$ be categories. A contravariant functor $F: scr(A)^("op") arrow scr(B)$.
An ordinary functor is also called a covariant functor.

An example: Map from a vector space of row vectors to scalars is a column vector.

A *presheaf* on a category $scr(A)$ is a contravariant functor from $scr(A)^("op") arrow$ *Set*.

Faithful and full functors: A functor $F: scr(A) arrow scr(B)$ is faithful if it is injective on morphisms, and full if it is surjective on morphisms.

== Natural transformations

When functors have the same domain and codomain, mapping between them is called a natural transformation.

#align(center, image("figs/natural_transform.png", width: 100%))

the following notation is used to indicate a natural transformation $alpha: F arrow G$:

#align(center, image("figs/natural_transform_2.png", width: 30%))

The concept of *natural isomorphism* is defined as follows:

#align(center, image("figs/natural_isomorphism.png", width: 100%))

If such a natural isomorphism exists, we say that $F$ and $G$ are *naturally isomorphic*.

*Equivalence of categories*

Two categories $scr(A)$ and $scr(B)$ are isomorphic if there exists a pair of functors $F: scr(A) arrow scr(B)$ and $G: scr(B) arrow scr(A)$ such that $F circle.small G = 1_{scr(B)}$ and $G circle.small F = 1_{scr(A)}$.

#align(center, image("figs/equivalence_of_categories.png", width: 100%))


A functor is an *equivalence* if it is full, faithful and essentially surjective.

= Chapter 2: Adjoints

== Definition of adjoint functors

#align(center, image("figs/adjoint_definition.png", width: 100%))

#align(center, image("figs/adjoint_definition_2.png", width: 100%))

Question: why there is a direction? Shouldn't $F$ and $G$ be symmetric? Because the direction of the functors?

In general, a forgetful functor does not usually has a right adjoint. 
An exception is the functors from groups to monoids.

#align(center, image("figs/adjoint_functor_group_monoid.png", width: 20%))

An algebraic theory consists of two things: first, a collection of operations, each with a specified arity (number of inputs), and second, a collection of equations.
In a nutshell, the main property of algebras for an algebraic theory is that the operations are defined everywhere on the set, and the equations hold everywhere too.

#align(center, image("figs/algebraic_theory.png", width: 100%))

Indiscrete topology: only contains the empty set and the whole space, very trivial.

#align(center, image("figs/initial_terminal.png", width: 100%))

== Adjunctions via units and counits

Units and counits are natural transformations that are related to each other by an adjunction.

#align(center, image("figs/units_counits.png", width: 100%))

About example 2.2.1: #link("https://math.stackexchange.com/questions/3357852/whats-the-difference-between-a-linear-sum-and-its-value")

The main idea should be that a formal linear map is a set?

#align(center, image("figs/adjunction_commute.png", width: 100%))


Let $scr(A)$ and $scr(B)$ be an adjunction $F tack.l G$, which means with units and counits,
$
  dash(g) = G(g) circle.small eta_A, " " dash(f) = epsilon_B circle.small F(f)
$

#align(center, image("figs/correspondence_adj_unit_counit.png", width: 100%))

A great way to represent the triangle identities is to use the following diagram:

#align(center, image("figs/triangle_identities_diagram.png", width: 100%))

The comma category:

#align(center, image("figs/comma_category.png", width: 100%))

#align(center, image("figs/comma_category_2.png", width: 100%))

Connection between comma categories and adjunctions:

#align(center, image("figs/comma_category_adjunction.png", width: 100%))


As a result, the adjoints can be characterized by the initial objects in the comma categories.

#align(center, image("figs/initial_object_comma_category.png", width: 100%))

An application of this characterization is the following:

#align(center, image("figs/initial_object_comma_category_2.png", width: 100%))

= Chapter 3: Representables

This chapter explores the theme of how each object sees and is seen by the category in which it lives. We are naturally led to the notion of representable functor, which (after adjunctions) provides our second approach to the idea of universal property.

Some related link: 
- #link("https://www.youtube.com/watch?v=hnc_RB1uZVo&ab_channel=RichardSouthwell")[Category Theory For Beginners: Representable Functors]

== Definitions and examples

A representable functor can be fully characterized by~$scr(A)(A, -)$.

#align(center, image("figs/representable_functor.png", width: 100%))

#align(center, image("figs/representable_functor_image.png", width: 50%))

#align(center, image("figs/representation.png", width: 100%))

Not all functors into *Set* are representable, but forgetful functors (more generally, functors with left adjoints) are.

#align(center, image("figs/left_adjoint.png", width: 100%))

#align(center, image("figs/opposite_map.png", width: 100%))

#align(center, image("figs/opposite_map_2.png", width: 100%))

#align(center, image("figs/dual_representable.png", width: 100%))

#align(center, image("figs/yoneda_embedding.png", width: 100%))

One more definition: (I don't understand this)

#align(center, image("figs/A_Aop.png", width: 100%))

Generalized elements:

#align(center, image("figs/generalized_elements.png", width: 100%))

== The Yoneda lemma

Video: #link("https://www.youtube.com/watch?v=h64yZs8ThtQ&ab_channel=RichardSouthwell")[Category Theory For Beginners: Yoneda Lemma]

#align(center, image("figs/yoneda_lemma.png", width: 100%))

= Chapter 5: Limits

Limits are about what goes on inside a category.
Whenever you meet a method for taking some objects and maps in a category and constructing a new object out of them, there is a good chance that you are looking at either a limit or a colimit.

== Definitions and examples

Here are three types of limits: product, equalizer and pullback.

=== Product

#align(center, image("figs/product_projection.png", width: 100%))

Here the point is existence of $P$.

An example:

#align(center, image("figs/product_example.png", width: 100%))


A generalized version of product:

#align(center, image("figs/product_projection_2.png", width: 100%))

=== Equalizers

#align(center, image("figs/equalizer.png", width: 100%))

=== Pullbacks

#align(center, image("figs/pullback.png", width: 100%))

=== Definition of limit

#align(center, image("figs/shape_definition.png", width: 100%))

#align(center, image("figs/limit_definition.png", width: 100%))

=== Monics

#align(center, image("figs/monic.png", width: 100%))

#align(center, image("figs/pullback_monic.png", width: 100%))

The dual concepts of product, equalizer and pullback are coproduct, coequalizer and pushout.
Dual concept of monic is epic.

== Interactions between functors and limits

#align(center, image("figs/functor_limit.png", width: 100%))

#align(center, image("figs/functor_limit_2.png", width: 100%))