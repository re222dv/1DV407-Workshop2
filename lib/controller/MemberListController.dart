part of boat_club;

class MemberListController {
    MemberListView _view;
    MemberRepository _repository;

    MemberListController(this._view, this._repository);

    run() {
        _repository.getAll().then((memberList) => _view.renderDetailed(memberList));
    }
}
