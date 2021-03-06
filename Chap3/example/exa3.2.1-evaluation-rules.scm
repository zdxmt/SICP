; 在求值的环境模型里，一个过程总是一个对偶，有一些代码和一个指向环境的指针组成。
; 过程只能通过一种方式创建，即lambda表达式，过程定义的语法形式，不过就是作为其基础的隐含lambda表达式的语法糖衣
(define (square x) (* x x))
; 求值define表达式的过程：这里的过程对象是一个序对，其代码部分描述的是一个带有形式参数x的过程，过程体是(* x x)，
; 过程对象的环境部分是一个指向全局环境的指针，因为产生的这个过程的lambda表达式是在全局环境中求值的。

; 过程应用的描述：在将一个过程应用于一组实际参数时，将会建立起一个新环境，其中包含了将所有形式参数约束与对应的实际参数的框架，
; 该框架的外围环境就是所用的那个过程的环境。随后就在这个新环境之下求值过程的体。

; 过程应用的环境模型总结为下面的两条规则；
; 1) 将一个过程对象应用于以及实际参数，将构造出一个新框架，其中将过程的形式参数约束到调用时的实际参数，而后在构造起的这一新环境的上下文中求值过程体。
;    这个新框架的外围环境就是作为被应用的那个过程对象的一部分环境。

; 2) 相对于一个给定环境求值一个lambda表达式，将创建一个过程对象，这个过程对象是一个序对，由该lambda表达式的正文和一个指向环境的指针组成，这一指针指向的就是创建这个过程对象的环境。