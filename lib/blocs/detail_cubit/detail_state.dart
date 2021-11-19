part of 'detail_cubit.dart';

enum PanelStatus { init, open, closed }

class DetailState extends Equatable {
  const DetailState._({
    this.status = PanelStatus.init,
  });

  const DetailState.init() : this._();

  const DetailState.open() : this._(status: PanelStatus.open);

  const DetailState.closed() : this._(status: PanelStatus.closed);

  final PanelStatus status;

  @override
  List<Object> get props => [status];
}
