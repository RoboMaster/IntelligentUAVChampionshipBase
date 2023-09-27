# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from airsim_ros/Circle.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg

class Circle(genpy.Message):
  _md5sum = "182de38a68dfb7440273ce21ac6bad6d"
  _type = "airsim_ros/Circle"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint8 index
geometry_msgs/Vector3 position
float64 yaw
================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z"""
  __slots__ = ['index','position','yaw']
  _slot_types = ['uint8','geometry_msgs/Vector3','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       index,position,yaw

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Circle, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.index is None:
        self.index = 0
      if self.position is None:
        self.position = geometry_msgs.msg.Vector3()
      if self.yaw is None:
        self.yaw = 0.
    else:
      self.index = 0
      self.position = geometry_msgs.msg.Vector3()
      self.yaw = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_B4d().pack(_x.index, _x.position.x, _x.position.y, _x.position.z, _x.yaw))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.position is None:
        self.position = geometry_msgs.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 33
      (_x.index, _x.position.x, _x.position.y, _x.position.z, _x.yaw,) = _get_struct_B4d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_B4d().pack(_x.index, _x.position.x, _x.position.y, _x.position.z, _x.yaw))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.position is None:
        self.position = geometry_msgs.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 33
      (_x.index, _x.position.x, _x.position.y, _x.position.z, _x.yaw,) = _get_struct_B4d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B4d = None
def _get_struct_B4d():
    global _struct_B4d
    if _struct_B4d is None:
        _struct_B4d = struct.Struct("<B4d")
    return _struct_B4d
