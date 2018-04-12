#include "core/Errors.h"

namespace ruby_typer {
namespace core {
namespace errors {
namespace Infer {
constexpr ErrorClass PinnedVariableMismatch = 7001;
constexpr ErrorClass MethodArgumentMismatch = 7002;
constexpr ErrorClass UnknownMethod = 7003;
constexpr ErrorClass MethodArgumentCountMismatch = 7004;
constexpr ErrorClass ReturnTypeMismatch = 7005;
constexpr ErrorClass DeadBranchInferencer = 7006;
constexpr ErrorClass CastTypeMismatch = 7007;
constexpr ErrorClass OverloadedArgumentCountMismatch = 7008;
constexpr ErrorClass BareTypeUsage = 7009;
constexpr ErrorClass GenericArgumentCountMismatch = 7010;
constexpr ErrorClass IncompleteType = 7011;
constexpr ErrorClass GlobalReassignmentTypeMismatch = 7012;
constexpr ErrorClass FieldReassignmentTypeMismatch = 7013;
constexpr ErrorClass GenericMethodConstaintUnsolved = 7013;

} // namespace Infer
} // namespace errors
} // namespace core
} // namespace ruby_typer
