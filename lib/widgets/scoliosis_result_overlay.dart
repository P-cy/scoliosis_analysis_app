import 'package:flutter/material.dart';
import 'package:scoliosis_analysis_app/models/scoliosis_result.dart';

class ScoliosisResultOverlay extends StatelessWidget {
  final ScoliosisResult? result;
  final bool isLoading;
  final VoidCallback? onRetry;

  const ScoliosisResultOverlay({
    super.key,
    this.result,
    this.isLoading = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(width: 16),
            Text(
              'กำลังวิเคราะห์...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    if (result == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                result!.isNormal ? Icons.check_circle : Icons.warning,
                color: result!.isNormal ? Colors.green : Colors.red,
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  result!.classification == "ไม่สามารถวิเคราะห์ได้"
                      ? result!.classification
                      : result!.isNormal
                          ? 'ผลการวิเคราะห์: ปกติ'
                          : 'ผลการวิเคราะห์: พบความผิดปกติ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: result!.classification == "ไม่สามารถวิเคราะห์ได้"
                        ? Colors.orange
                        : result!.isNormal
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
              ),
              if (onRetry != null)
                IconButton(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'วิเคราะห์ใหม่',
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            result!.message,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          if (result!.confidence > 0) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'ความเชื่อมั่น: ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${(result!.confidence * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 14,
                    color: result!.confidence > 0.8
                        ? Colors.green
                        : result!.confidence > 0.6
                            ? Colors.orange
                            : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
          if (result!.keypoints.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'จุดตรวจจับ: ${result!.keypoints.where((kp) => kp.confidence > 0.3).length}/12',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
          if (!result!.isNormal && result!.classification != "ไม่สามารถวิเคราะห์ได้") ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.medical_services, color: Colors.red, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'คำแนะนำ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'เพื่อความแน่ใจและการวินิจฉัยที่ถูกต้อง แนะนำให้ไปพบแพทย์เฉพาะทางเพื่อตรวจสอบเพิ่มเติม',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (result!.isNormal) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.health_and_safety, color: Colors.green, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'การดูแลสุขภาพ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'แม้ผลจะปกติ การออกกำลังกายและดูแลท่าทางยังคงสำคัญ เพื่อป้องกันปัญหาในอนาคต',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class RealTimeResultOverlay extends StatelessWidget {
  final ScoliosisResult? result;
  final bool isAnalyzing;

  const RealTimeResultOverlay({
    super.key,
    this.result,
    this.isAnalyzing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25),
        ),
        child: isAnalyzing
            ? const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'กำลังวิเคราะห์...',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              )
            : result == null
                ? const Text(
                    'วางท่าให้เห็นหลังเพื่อเริ่มการวิเคราะห์',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  )
                : Row(
                    children: [
                      Icon(
                        result!.isNormal ? Icons.check_circle : Icons.warning,
                        color: result!.isNormal ? Colors.green : Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          result!.isNormal ? 'ปกติ' : 'ตรวจพบความผิดปกติ',
                          style: TextStyle(
                            color: result!.isNormal ? Colors.green : Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (result!.confidence > 0)
                        Text(
                          '${(result!.confidence * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
      ),
    );
  }
}