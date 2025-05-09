from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from django.contrib.auth.models import User
from rest_framework_simplejwt.tokens import RefreshToken
from .models import ModelName, Booking, Blog, Testimonial, Guide, Contact
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

class BookingViewTests(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='testpassword')
        self.client.force_authenticate(user=self.user)
        self.url = reverse('booking_list_create')

    def test_get_bookings(self):
        Booking.objects.create(user=self.user, destination_id=1, start_date='2022-01-01', end_date='2022-01-10', payment_status='Paid')
        Booking.objects.create(user=self.user, destination_id=2, start_date='2022-02-01', end_date='2022-02-10', payment_status='Pending')
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 2)

    def test_post_booking(self):
        data = {
            'user': self.user.id,
            'destination': 1,
            'start_date': '2022-03-01',
            'end_date': '2022-03-10',
            'payment_status': 'Paid'
        }
        response = self.client.post(self.url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Booking.objects.count(), 1)
        self.assertEqual(Booking.objects.get().payment_status, 'Paid')

class BlogViewTests(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='testpassword')
        self.client.force_authenticate(user=self.user)
        self.url = reverse('blog_list_create')

    def test_get_blogs(self):
        Blog.objects.create(title='Blog 1', content='Content 1', author='Author 1')
        Blog.objects.create(title='Blog 2', content='Content 2', author='Author 2')
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 2)

    def test_post_blog(self):
        data = {
            'title': 'Blog 3',
            'content': 'Content 3',
            'author': 'Author 3'
        }
        response = self.client.post(self.url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Blog.objects.count(), 1)
        self.assertEqual(Blog.objects.get().title, 'Blog 3')

class TestimonialViewTests(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='testpassword')
        self.client.force_authenticate(user=self.user)
        self.url = reverse('testimonial_list_create')

    def test_get_testimonials(self):
        Testimonial.objects.create(customer_name='Customer 1', content='Content 1', rating=5)
        Testimonial.objects.create(customer_name='Customer 2', content='Content 2', rating=4)
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 2)

    def test_post_testimonial(self):
        data = {
            'customer_name': 'Customer 3',
            'content': 'Content 3',
            'rating': 5
        }
        response = self.client.post(self.url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Testimonial.objects.count(), 1)
        self.assertEqual(Testimonial.objects.get().customer_name, 'Customer 3')

class GuideViewTests(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='testpassword')
        self.client.force_authenticate(user=self.user)
        self.url = reverse('guide_list_create')

    def test_get_guides(self):
        Guide.objects.create(name='Guide 1', bio='Bio 1', languages=['English'])
        Guide.objects.create(name='Guide 2', bio='Bio 2', languages=['Spanish'])
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 2)

    def test_post_guide(self):
        data = {
            'name': 'Guide 3',
            'bio': 'Bio 3',
            'languages': ['French']
        }
        response = self.client.post(self.url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Guide.objects.count(), 1)
        self.assertEqual(Guide.objects.get().name, 'Guide 3')

class ContactViewTests(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='testpassword')
        self.client.force_authenticate(user=self.user)
        self.url = reverse('contact_list_create')

    def test_get_contacts(self):
        Contact.objects.create(name='Contact 1', email='contact1@example.com', message='Message 1')
        Contact.objects.create(name='Contact 2', email='contact2@example.com', message='Message 2')
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data['results']), 2)

    def test_post_contact(self):
        data = {
            'name': 'Contact 3',
            'email': 'contact3@example.com',
            'message': 'Message 3'
        }
        response = self.client.post(self.url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Contact.objects.count(), 1)
        self.assertEqual(Contact.objects.get().name, 'Contact 3')
