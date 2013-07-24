=======
Hyscore
=======

Hyscore presents a set of libraries inspired by the Functional Programming
paradigm.

Examples can be usually found in the tests.

map
---

`map` takes 2 arguments, a function and an iterable and returns a generator.
This generator successively yields the result of applying `function` to the
elements of `iterable`.

Here's a similar implementation of `map` in Python:

.. code-block:: python

   def map(function, iterable):
       return (function(element) for element in iterable)


.. note:: This function will behave similarly to the `map` builtin in Python 3.
	  However it differs from `map` in Python 2 (the latter returns a list
	  and note a generator).


filter
------

`filter` takes 2 arguments, a predicate function and an iterable and returns
a generator. This generator successively yields all the elements of `iterable`
which return a truthy value when passed as argument to `predicate`.

Here's a similar implementation of `filter` in Python:

.. code-block:: python

   def filter(predicate, iterable):
       return (element for element in iterable if predicate(element))


.. note:: This function will behave similarly to the `filter` builtin in Python 3.
	  However it differs from `filter` in Python 2 (the latter returns a list
	  and note a generator).


find
----

`find` takes 2 arguments, a predicate and an iterable and returns the first
value which returns a truthy value when passed as argument to `predicate`. If no
value is found, it returns `None`.


fold-left
--------

`fold-left` takes 3 arguments, a function, an iterable and an initial
value. This function reduces the iterable by successively applying the function
to elements of the iterable. For example, here's how to express `sum` in terms
of `fold`:

.. code-block:: clj

   (defn sum [iterable]
     (fold-left operator.add iterable 0)

fold-right
----------

`fold-right` is the right associative version of `fold-left`.

.. note:: There's no point in disctinguishing between `fold-right` and
	  `fold-left` for associative operations like addition or
	  multiplication. They will behave differently, for example, for
	  substraction or division.

reject
------

`reject` takes 2 arguments, a predicate and an iterable, and returns a
generator. This generator successively yields all the values that fail the
predicate.

Here's a similar implementation of `reject` in Python:

.. code-block:: python

   def reject(predicate, iterable):
       return (element for element in iterable if not predicate(element))

head
----

`head` takes one argument, an iterable, and returns its first element. If the
iterable is empty, it returns None.

last
----

`last` takes one argument, an iterable, and returns its last element. If the
iterable is empty it returns None.

.. note:: `last` will not check that the iteration terminates. If you feed it an
	  infinite generator, you're creating an infinite loop.
