import 'package:flutter/material.dart';

class KegiatanHariIni extends StatelessWidget {
  final String imageUrl;
  final String Kategori;
  final String Kegiatan;
  final String lokasi;
  final VoidCallback? onTap;

  const KegiatanHariIni({
    Key? key,
    required this.imageUrl,
    required this.Kategori,
    required this.Kegiatan,
    required this.lokasi,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      // height: null, // Remove or comment out the height property to let the container size itself to its content
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Location Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Content
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Distance
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Color(0xFF539DF3).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              Kategori,
                              style: const TextStyle(
                                color: Color(0xFF539DF3),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Location Name
                      Text(
                        Kegiatan,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),

                      // lokasi
                      Row(
                        children: [
                          Text(
                            lokasi,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Arrow Icon
                Icon(
                  Icons.chevron_right,
                  color: Color(0xFF539DF3),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
