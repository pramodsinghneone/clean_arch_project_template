import 'package:clean_arch_project_template/feature/data/models/user_model.dart';
import 'package:clean_arch_project_template/feature/presentation/cubits/cubit/users_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersDetailsCubit>(context).getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: BlocBuilder<UsersDetailsCubit, UsersDetailsState>(
        builder: (context, state) {
          if (state is UsersDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersDetailsFailure) {
            return Center(
              child: Text(
                state.errorMsg,
              ),
            );
          } else if (state is UsersDetailsLoaded) {
            return _bodyWidget(state.userModel);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _bodyWidget(UserModel userModel) {
    return ListView.builder(
      itemCount: userModel.data!.length,
      itemBuilder: (context, index) {
        var item = userModel.data![index];
        return ListTile(
          title: Text("${item.firstName!} ${item.lastName}"),
          subtitle: Text("${item.email}"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.avatar!),
          ),
        );
      },
    );
  }
}
