// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
//
// part of 'registeration_state.dart';
//
// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************
//
// T _$identity<T>(T value) => value;
//
// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
//
// /// @nodoc
// mixin _$RegisterState<T> {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() idle,
//     required TResult Function() loading,
//     required TResult Function(T data) success,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? idle,
//     TResult? Function()? loading,
//     TResult? Function(T data)? success,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? idle,
//     TResult Function()? loading,
//     TResult Function(T data)? success,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Idle<T> value) idle,
//     required TResult Function(Loading<T> value) loading,
//     required TResult Function(Success<T> value) success,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Idle<T> value)? idle,
//     TResult? Function(Loading<T> value)? loading,
//     TResult? Function(Success<T> value)? success,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Idle<T> value)? idle,
//     TResult Function(Loading<T> value)? loading,
//     TResult Function(Success<T> value)? success,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }
//
// /// @nodoc
// abstract class $RegisterStateCopyWith<T, $Res> {
//   factory $RegisterStateCopyWith(
//           RegisterState<T> value, $Res Function(RegisterState<T>) then) =
//       _$RegisterStateCopyWithImpl<T, $Res, RegisterState<T>>;
// }
//
// /// @nodoc
// class _$RegisterStateCopyWithImpl<T, $Res, $Val extends RegisterState<T>>
//     implements $RegisterStateCopyWith<T, $Res> {
//   _$RegisterStateCopyWithImpl(this._value, this._then);
//
//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
// }
//
// /// @nodoc
// abstract class _$$IdleCopyWith<T, $Res> {
//   factory _$$IdleCopyWith(_$Idle<T> value, $Res Function(_$Idle<T>) then) =
//       __$$IdleCopyWithImpl<T, $Res>;
// }
//
// /// @nodoc
// class __$$IdleCopyWithImpl<T, $Res>
//     extends _$RegisterStateCopyWithImpl<T, $Res, _$Idle<T>>
//     implements _$$IdleCopyWith<T, $Res> {
//   __$$IdleCopyWithImpl(_$Idle<T> _value, $Res Function(_$Idle<T>) _then)
//       : super(_value, _then);
// }
//
// /// @nodoc
//
// class _$Idle<T> implements Idle<T> {
//   const _$Idle();
//
//   @override
//   String toString() {
//     return 'RegisterState<$T>.idle()';
//   }
//
//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$Idle<T>);
//   }
//
//   @override
//   int get hashCode => runtimeType.hashCode;
//
//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() idle,
//     required TResult Function() loading,
//     required TResult Function(T data) success,
//   }) {
//     return idle();
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? idle,
//     TResult? Function()? loading,
//     TResult? Function(T data)? success,
//   }) {
//     return idle?.call();
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? idle,
//     TResult Function()? loading,
//     TResult Function(T data)? success,
//     required TResult orElse(),
//   }) {
//     if (idle != null) {
//       return idle();
//     }
//     return orElse();
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Idle<T> value) idle,
//     required TResult Function(Loading<T> value) loading,
//     required TResult Function(Success<T> value) success,
//   }) {
//     return idle(this);
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Idle<T> value)? idle,
//     TResult? Function(Loading<T> value)? loading,
//     TResult? Function(Success<T> value)? success,
//   }) {
//     return idle?.call(this);
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Idle<T> value)? idle,
//     TResult Function(Loading<T> value)? loading,
//     TResult Function(Success<T> value)? success,
//     required TResult orElse(),
//   }) {
//     if (idle != null) {
//       return idle(this);
//     }
//     return orElse();
//   }
// }
//
// abstract class Idle<T> implements RegisterState<T> {
//   const factory Idle() = _$Idle<T>;
// }
//
// /// @nodoc
// abstract class _$$LoadingCopyWith<T, $Res> {
//   factory _$$LoadingCopyWith(
//           _$Loading<T> value, $Res Function(_$Loading<T>) then) =
//       __$$LoadingCopyWithImpl<T, $Res>;
// }
//
// /// @nodoc
// class __$$LoadingCopyWithImpl<T, $Res>
//     extends _$RegisterStateCopyWithImpl<T, $Res, _$Loading<T>>
//     implements _$$LoadingCopyWith<T, $Res> {
//   __$$LoadingCopyWithImpl(
//       _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
//       : super(_value, _then);
// }
//
// /// @nodoc
//
// class _$Loading<T> implements Loading<T> {
//   const _$Loading();
//
//   @override
//   String toString() {
//     return 'RegisterState<$T>.loading()';
//   }
//
//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$Loading<T>);
//   }
//
//   @override
//   int get hashCode => runtimeType.hashCode;
//
//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() idle,
//     required TResult Function() loading,
//     required TResult Function(T data) success,
//   }) {
//     return loading();
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? idle,
//     TResult? Function()? loading,
//     TResult? Function(T data)? success,
//   }) {
//     return loading?.call();
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? idle,
//     TResult Function()? loading,
//     TResult Function(T data)? success,
//     required TResult orElse(),
//   }) {
//     if (loading != null) {
//       return loading();
//     }
//     return orElse();
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Idle<T> value) idle,
//     required TResult Function(Loading<T> value) loading,
//     required TResult Function(Success<T> value) success,
//   }) {
//     return loading(this);
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Idle<T> value)? idle,
//     TResult? Function(Loading<T> value)? loading,
//     TResult? Function(Success<T> value)? success,
//   }) {
//     return loading?.call(this);
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Idle<T> value)? idle,
//     TResult Function(Loading<T> value)? loading,
//     TResult Function(Success<T> value)? success,
//     required TResult orElse(),
//   }) {
//     if (loading != null) {
//       return loading(this);
//     }
//     return orElse();
//   }
// }
//
// abstract class Loading<T> implements RegisterState<T> {
//   const factory Loading() = _$Loading<T>;
// }
//
// /// @nodoc
// abstract class _$$SuccessCopyWith<T, $Res> {
//   factory _$$SuccessCopyWith(
//           _$Success<T> value, $Res Function(_$Success<T>) then) =
//       __$$SuccessCopyWithImpl<T, $Res>;
//   @useResult
//   $Res call({T data});
// }
//
// /// @nodoc
// class __$$SuccessCopyWithImpl<T, $Res>
//     extends _$RegisterStateCopyWithImpl<T, $Res, _$Success<T>>
//     implements _$$SuccessCopyWith<T, $Res> {
//   __$$SuccessCopyWithImpl(
//       _$Success<T> _value, $Res Function(_$Success<T>) _then)
//       : super(_value, _then);
//
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? data = freezed,
//   }) {
//     return _then(_$Success<T>(
//       freezed == data
//           ? _value.data
//           : data // ignore: cast_nullable_to_non_nullable
//               as T,
//     ));
//   }
// }
//
// /// @nodoc
//
// class _$Success<T> implements Success<T> {
//   const _$Success(this.data);
//
//   @override
//   final T data;
//
//   @override
//   String toString() {
//     return 'RegisterState<$T>.success(data: $data)';
//   }
//
//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$Success<T> &&
//             const DeepCollectionEquality().equals(other.data, data));
//   }
//
//   @override
//   int get hashCode =>
//       Object.hash(runtimeType, const DeepCollectionEquality().hash(data));
//
//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
//       __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);
//
//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() idle,
//     required TResult Function() loading,
//     required TResult Function(T data) success,
//   }) {
//     return success(data);
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? idle,
//     TResult? Function()? loading,
//     TResult? Function(T data)? success,
//   }) {
//     return success?.call(data);
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? idle,
//     TResult Function()? loading,
//     TResult Function(T data)? success,
//     required TResult orElse(),
//   }) {
//     if (success != null) {
//       return success(data);
//     }
//     return orElse();
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Idle<T> value) idle,
//     required TResult Function(Loading<T> value) loading,
//     required TResult Function(Success<T> value) success,
//   }) {
//     return success(this);
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Idle<T> value)? idle,
//     TResult? Function(Loading<T> value)? loading,
//     TResult? Function(Success<T> value)? success,
//   }) {
//     return success?.call(this);
//   }
//
//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Idle<T> value)? idle,
//     TResult Function(Loading<T> value)? loading,
//     TResult Function(Success<T> value)? success,
//     required TResult orElse(),
//   }) {
//     if (success != null) {
//       return success(this);
//     }
//     return orElse();
//   }
// }
//
// abstract class Success<T> implements RegisterState<T> {
//   const factory Success(final T data) = _$Success<T>;
//
//   T get data;
//   @JsonKey(ignore: true)
//   _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
//       throw _privateConstructorUsedError;
// }
