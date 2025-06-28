# BCList-Dictionary
# 📦 List Data Type
# Description
  The List of [T] type provides a dynamically sized, strongly‑typed array (1‑based index). Unlike static arrays, lists don’t require predefined dimensions 
# Core Methods :

  Add(T), AddRange(...)
  
  Contains(T)
  
  Count()
  
  Get(idx) (1‑based), GetRange(...)
  
  IndexOf(T), LastIndexOf(T)
  
  Insert(idx, T)
  
  Remove(T), RemoveAt(idx), RemoveRange(...)
  
  Reverse()
  
  Set(idx, T)

# 📗 Dictionary Data Type
# Description
  Dictionary of [TKey, TValue] offers fast, memory-based key–value mapping with unique, non-nullable keys

# Core Methods :

  Add(key, value)
  
  ContainsKey(key)
  
  Count()
  
  Get(key), Get(key, var value)
  
  Set(key, value) (and version returning old value)
  
  Remove(key)
  
  Keys() → List of [TKey]
  
  Values() → List of [TValue]

# Notes:

  Like List, Dictionary is a reference type; assignment copies the reference. Use shallow-copy by looping through Keys()

  Keys must be unique and non-null; values can be null if of reference type 
