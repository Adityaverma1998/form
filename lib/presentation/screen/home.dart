import 'package:basic_form/presentation/blocs/add_form_data_bloc.dart';
import 'package:basic_form/presentation/model/common_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CommonResponse? selectedState;
  CommonResponse? selectedDistrict;

  List<CommonResponse> statesList = [];
  List<CommonResponse> districtList = [];

  @override
  void initState() {
    super.initState();
    context.read<AddFormBloc>().add(GetStateCommonList());
    context.read<AddFormBloc>().add(GetDistrictCommonList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Form with States & Districts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AddFormBloc, AddFormDataState>(
          listener: (context, state) {
            if (state is StateListLoaded) {
              setState(() {
                statesList = state.states;
              });
            } else if (state is DistrictListLoaded) {
              setState(() {
                districtList = state.districts;
              });
            } else if (state is AddFormDataError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is AddFormDataLoading) ...[
                  Center(child: CircularProgressIndicator()),
                ],
                DropdownButtonFormField<CommonResponse>(
                  value: selectedState,
                  hint: Text('Select State'),
                  items: statesList.map((CommonResponse stateItem) {
                    return DropdownMenuItem<CommonResponse>(
                      value: stateItem,
                      child: Text(stateItem.title ?? ''),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedState = value;
                      selectedDistrict = null;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'State',
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<CommonResponse>(
                  value: selectedDistrict,
                  hint: Text('Select District'),
                  items: districtList.map((CommonResponse district) {
                    return DropdownMenuItem<CommonResponse>(
                      value: district,
                      child: Text(district.title ?? ''),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDistrict = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'District',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
