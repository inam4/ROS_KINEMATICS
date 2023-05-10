;; Auto-generated. Do not edit!


(when (boundp 'kinematics_legged::bezier)
  (if (not (find-package "KINEMATICS_LEGGED"))
    (make-package "KINEMATICS_LEGGED"))
  (shadow 'bezier (find-package "KINEMATICS_LEGGED")))
(unless (find-package "KINEMATICS_LEGGED::BEZIER")
  (make-package "KINEMATICS_LEGGED::BEZIER"))

(in-package "ROS")
;;//! \htmlinclude bezier.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass kinematics_legged::bezier
  :super ros::object
  :slots (_x _y _z ))

(defmethod kinematics_legged::bezier
  (:init
   (&key
    ((:x __x) ())
    ((:y __y) ())
    ((:z __z) ())
    )
   (send-super :init)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   self)
  (:x
   (&rest __x)
   (if (keywordp (car __x))
       (send* _x __x)
     (progn
       (if __x (setq _x (car __x)))
       _x)))
  (:y
   (&rest __y)
   (if (keywordp (car __y))
       (send* _y __y)
     (progn
       (if __y (setq _y (car __y)))
       _y)))
  (:z
   (&rest __z)
   (if (keywordp (car __z))
       (send* _z __z)
     (progn
       (if __z (setq _z (car __z)))
       _z)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Float32[] _x
    (apply #'+ (send-all _x :serialization-length)) 4
    ;; std_msgs/Float32[] _y
    (apply #'+ (send-all _y :serialization-length)) 4
    ;; std_msgs/Float32[] _z
    (apply #'+ (send-all _z :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float32[] _x
     (write-long (length _x) s)
     (dolist (elem _x)
       (send elem :serialize s)
       )
     ;; std_msgs/Float32[] _y
     (write-long (length _y) s)
     (dolist (elem _y)
       (send elem :serialize s)
       )
     ;; std_msgs/Float32[] _z
     (write-long (length _z) s)
     (dolist (elem _z)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float32[] _x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x (let (r) (dotimes (i n) (push (instance std_msgs::Float32 :init) r)) r))
     (dolist (elem- _x)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/Float32[] _y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y (let (r) (dotimes (i n) (push (instance std_msgs::Float32 :init) r)) r))
     (dolist (elem- _y)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/Float32[] _z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _z (let (r) (dotimes (i n) (push (instance std_msgs::Float32 :init) r)) r))
     (dolist (elem- _z)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get kinematics_legged::bezier :md5sum-) "091cca004b733810eb3a4ffef5db3158")
(setf (get kinematics_legged::bezier :datatype-) "kinematics_legged/bezier")
(setf (get kinematics_legged::bezier :definition-)
      "std_msgs/Float32[] x
std_msgs/Float32[] y
std_msgs/Float32[] z

================================================================================
MSG: std_msgs/Float32
float32 data
")



(provide :kinematics_legged/bezier "091cca004b733810eb3a4ffef5db3158")


