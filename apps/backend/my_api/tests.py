from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from django.contrib.auth.models import User
from rest_framework_simplejwt.tokens import RefreshToken
from .models import ModelName
from .serializers import ModelNameSerializer

class FunctionalityViewTests(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='testpassword')
        self.client.force_authenticate(user=self.user)
        self.url = reverse('functionality')

    def test_get_functionality(self):
        ModelName.objects.create(field1='test1', field2=1, field3='2022-01-01', relationship_field_id=1)
        ModelName.objects.create(field1='test2', field2=2, field3='2022-01-02', relationship_field_id=1)
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 2)

    def test_post_functionality(self):
        data = {
            'field1': 'test3',
            'field2': 3,
            'field3': '2022-01-03',
            'relationship_field': 1
        }
        response = self.client.post(self.url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(ModelName.objects.count(), 1)
        self.assertEqual(ModelName.objects.get().field1, 'test3')

    def test_get_functionality_with_query_params(self):
        ModelName.objects.create(field1='test1', field2=1, field3='2022-01-01', relationship_field_id=1)
        ModelName.objects.create(field1='test2', field2=2, field3='2022-01-02', relationship_field_id=1)
        response = self.client.get(self.url, {'field1': 'test1'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 1)
        self.assertEqual(response.data['results'][0]['field1'], 'test1')

    def test_pagination(self):
        for i in range(15):
            ModelName.objects.create(field1=f'test{i}', field2=i, field3='2022-01-01', relationship_field_id=1)
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 10)  # Assuming PAGE_SIZE is 10

    def test_filtering(self):
        ModelName.objects.create(field1='test1', field2=1, field3='2022-01-01', relationship_field_id=1)
        ModelName.objects.create(field1='test2', field2=2, field3='2022-01-02', relationship_field_id=1)
        response = self.client.get(self.url, {'field2': 1})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 1)
        self.assertEqual(response.data['results'][0]['field2'], 1)

    def test_sorting(self):
        ModelName.objects.create(field1='test1', field2=1, field3='2022-01-01', relationship_field_id=1)
        ModelName.objects.create(field1='test2', field2=2, field3='2022-01-02', relationship_field_id=1)
        response = self.client.get(self.url, {'ordering': '-field2'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['results'][0]['field2'], 2)

    def test_unauthenticated_access(self):
        self.client.force_authenticate(user=None)
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
