# iOS 学习笔记

## 1、KVC
> 自定义KVC(设置值和取值)流程 

### 1.1 NSKeyValueCoding介绍
```


/* 
默认为YES，在调用-valueForKey :、 -setValue：forKey :、 -mutableArrayValueForKey :、 -storedValueForKey :、 -takeStoredValue：forKey：和-takeValue：forKey：时。如果找不到对应的setter/_setter方法。就判断accessInstanceVariablesDirectly是否为YES，不为YES就抛出异常，否则可以下级查找。
*/
@property (class, readonly) BOOL accessInstanceVariablesDirectly;

/*
	具体可参考思维导图，取值过程
*/
- (nullable id)valueForKey:(NSString *)key;

/*
* 具体可参考思维导图，设置值过程
*/
- (void)setValue:(nullable id)value forKey:(NSString *)key;

/* 
KVC 验证API真实性、用来验证set值是否正确，在set值时对数据进行替换或者拦截.
*/
- (BOOL)validateValue:(inout id _Nullable * _Nonnull)ioValue forKey:(NSString *)inKey error:(out NSError **)outError;

/* */
- (NSMutableArray *)mutableArrayValueForKey:(NSString *)key;

/* */
- (NSMutableOrderedSet *)mutableOrderedSetValueForKey:(NSString *)key API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));

/**/
- (NSMutableSet *)mutableSetValueForKey:(NSString *)key;

/* */
- (nullable id)valueForKeyPath:(NSString *)keyPath;
- (void)setValue:(nullable id)value forKeyPath:(NSString *)keyPath;
- (BOOL)validateValue:(inout id _Nullable * _Nonnull)ioValue forKeyPath:(NSString *)inKeyPath error:(out NSError **)outError;
- (NSMutableArray *)mutableArrayValueForKeyPath:(NSString *)keyPath;
- (NSMutableOrderedSet *)mutableOrderedSetValueForKeyPath:(NSString *)keyPath API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
- (NSMutableSet *)mutableSetValueForKeyPath:(NSString *)keyPath;

/**/
- (nullable id)valueForUndefinedKey:(NSString *)key;

/**/
- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key;

/**/
- (void)setNilValueForKey:(NSString *)key;

/* */
- (NSDictionary<NSString *, id> *)dictionaryWithValuesForKeys:(NSArray<NSString *> *)keys;

/**/
- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *, id> *)keyedValues;



```