import 'package:dream_home_admin/features/home_plan_screen/home_plan_detail_screen.dart';
import 'package:flutter/material.dart';

class ExpandableTableCell extends StatelessWidget {
  final String text;

  const ExpandableTableCell({super.key, required this.text});

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  text,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDetailsDialog(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Icon(
            Icons.info_outline,
            size: 16,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class ArchitectViewDetailScreen extends StatelessWidget {
  final bool showTable;

  const ArchitectViewDetailScreen({super.key, this.showTable = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 15)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://png.pngtree.com/background/20230614/original/pngtree-man-in-a-suit-with-his-face-looking-towards-the-camera-picture-image_3535759.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Sarah Anderson',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Senior Architect, LEED AP',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Award-winning architect with 12+ years of experience in sustainable design and urban development. Specialized in contemporary residential and commercial projects with a focus on environmental innovation.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Education',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Master of Architecture',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text('Harvard Graduate School of Design',
                    style: TextStyle(fontSize: 16)),
                const Text('2008-2010',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 16),
                const Text(
                  'Bachelor of Environmental Design',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text('UC Berkeley', style: TextStyle(fontSize: 16)),
                const Text('2004-2008',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 32),
                const Text(
                  'Experience',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Senior Architect',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text('Foster + Partners', style: TextStyle(fontSize: 16)),
                const Text('2015-Present',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 8),
                const Text(
                  'Lead architect for sustainable commercial projects, managing teams of 15+ professionals and overseeing projects valued at \$50M+.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'LICENSE NO ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text('42499-GH', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 16),
                Container(
                  height: 190,
                  width: 360,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://shoegnome.com/wp-content/uploads/2013/08/Arch-License.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                if (showTable) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    child: DataTable(
                      columnSpacing: 20,
                      columns: const [
                        DataColumn(label: Text('Title')),
                        DataColumn(label: Text('Category')),
                        DataColumn(label: Text('Owned by')),
                        DataColumn(label: Text('Basic Details')),
                        DataColumn(label: Text('View')),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            const DataCell(Text('Sunset Villa',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                            const DataCell(Text('Scenic Homes')),
                            const DataCell(Text('15')),
                            DataCell(
                              SizedBox(
                                width: 200,
                                child: ExpandableTableCell(
                                  text:
                                      'Sunset Villa offers a spacious and elegant design with 4 bedrooms...',
                                ),
                              ),
                            ),
                            DataCell(
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomePlanDetailScreen(
                                          imageUrls: [
                                            'https://g.foolcdn.com/editorial/images/574911/new-home.jpg',
                                            'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg',
                                            'https://g.foolcdn.com/editorial/images/574911/new-home.jpg',
                                            'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg'
                                          ],
                                          title: 'Sunset Detail View',
                                          category: 'Modern Villa',
                                          price: 9000,
                                          architectName: 'Prakash',
                                          architectImage:
                                              'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg',
                                        ),
                                      ));
                                },
                                child: const Text('View Plan'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
