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

A *presheaf* on a category $scr(A)$ is a contravariant functor from $scr(A)^("op") arrow$ *Set*.

Faithful and full functors: A functor $F: scr(A) arrow scr(B)$ is faithful if it is injective on morphisms, and full if it is surjective on morphisms.

== Natural transformations