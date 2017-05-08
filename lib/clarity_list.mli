type 'a t = 'a list

val _Cons : 'a -> 'a list -> 'a list
val _Nil : 'a list

val append : 'a t -> 'a t -> 'a t
val length : 'a t -> int
val mapi : (int -> 'a -> 'b) -> 'a t -> 'b t
val rev : 'a t -> 'a t
val rev_map : ('a -> 'b) -> 'a t -> 'b t
val rev_mapi : (int -> 'a -> 'b) -> 'a t -> 'b t
val sort : ?cmp:('a -> 'a -> int) -> 'a t -> 'a t

include Monad.S with type 'a t := 'a t
include Align.S with type 'a t := 'a t
include Foldable.S with type 'a t := 'a t

module WithA3 (A : Applicative.Basic3) : Traversable.S3 with
  type 'a t := 'a t and
  type ('u, 'v, 'a) f := ('u, 'v, 'a) A.t
module WithA2 (A : Applicative.Basic2) : Traversable.S2 with
  type 'a t := 'a t and
  type ('u, 'a) f := ('u, 'a) A.t
module WithA (A : Applicative.Basic) : Traversable.S with
  type 'a t := 'a t and
  type 'a f := 'a A.t

module WithM3 (M : Monad.Basic3) : Foldable.M3 with
  type 'a t := 'a t and
  type ('u, 'v, 'a) m := ('u, 'v, 'a) M.t
module WithM2 (M : Monad.Basic2) : Foldable.M2 with
  type 'a t := 'a t and
  type ('u, 'a) m := ('u, 'a) M.t
module WithM (M : Monad.Basic) : Foldable.M with
  type 'a t := 'a t and
  type 'a m := 'a M.t
