
(cl:in-package :asdf)

(defsystem "kinematics_legged-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "bezier" :depends-on ("_package_bezier"))
    (:file "_package_bezier" :depends-on ("_package"))
  ))