import 'package:bloc/bloc.dart';
import 'package:testing/ui/contact_page.dart';
import 'package:testing/ui/developer_page.dart';
import 'package:testing/ui/events_page.dart';
import 'package:testing/ui/my_cards_page.dart';
import 'package:testing/ui/workshops_page.dart';

enum NavigationEvents {
  DashboardClickedEvent,
  EventsClickedEvent,
  WorkshopsClickedEvent,
  ContactClickedEvents,
  DeveloperClickedEvents,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final Function onMenuTap;

  NavigationBloc({this.onMenuTap});

  @override
  NavigationStates get initialState => MyCardsPage(
        onMenuTap: onMenuTap,
      );

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.DashboardClickedEvent:
        yield MyCardsPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.EventsClickedEvent:
        yield EventsPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.WorkshopsClickedEvent:
        yield WorkshopsPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.ContactClickedEvents:
        yield ContactPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.DeveloperClickedEvents:
        yield DeveloperPage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}
